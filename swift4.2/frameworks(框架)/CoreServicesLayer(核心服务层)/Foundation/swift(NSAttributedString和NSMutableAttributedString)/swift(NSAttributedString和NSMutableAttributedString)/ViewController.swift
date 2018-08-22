//
//  ViewController.swift
//  swift(NSAttributedString和NSMutableAttributedString)
//
//  Created by 范云飞 on 2018/8/22.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
import Accelerate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         AttributedString可以分为NSAttributedString和NSMutableAttributedString两种。
         在使用中通过将AttributedString赋值给控件的 attributedText 属性来添加文字样式。
         可设置的控件有UILabel、UITextField和UITextView。
         */
        

        
        //MARK:********************** NSAttributedString ***************************
        
        /*
         1. NSAttributedString 的初始化方法：
         public init(string str: String)
         
         public init(string str: String, attributes attrs: [NSAttributedStringKey : Any]? = nil)
         
         public init(attributedString attrStr: NSAttributedString)
         */
        
        let label = UILabel.init()
        label.center.x = self.view.center.x
        label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        let str1 = """
AttributedString可以分为NSAttributedString和NSMutableAttributedString两种。在使用中通过将AttributedString赋值给控件的 attributedText 属性来添加文字样式。可设置的控件有UILabel、UITextField和UITextView。
"""
        
        //MARK:--------------- 一般情况下的UILabel高度自适应的处理办法 ---------------------------
//        label.text = str1
//
//        /* 设置attributes */
//        let line = NSMutableParagraphStyle.init()
//        line.lineSpacing = 2.5
//
//        let attributedString = NSAttributedString(string: label.text!, attributes: [NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedStringKey.paragraphStyle:line])
//
//        /* 或者attributeString 的frame 重新 约束label */
//        let size = (label.text! as NSString).boundingRect(with: CGSize(width: self.view.frame.size.width - 40, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15)], context: nil)
//        label.frame = CGRect(x: 20, y: 100, width: size.width, height: size.height)
//        label.attributedText = attributedString
        
        //FIXME:上面的方法有很严中的bug,当text为单行时，text中的文字距离上下边距比较大，在UI渲染时误差也会比较大
        
        //MARK:---------------- 进一步优化的处理方法 ---------------------------
        
        let height = label.setSpace(labelText: str1, font: UIFont.boldSystemFont(ofSize: 15), lineSpace: 10, worldSpace: 1.5, width: self.view.frame.size.width - 40)
        label.frame = CGRect(x: 20, y: 100, width: self.view.frame.size.width - 40, height: height)
        
        
        //MARK:****************** NSMutableAttributedString **********************
//        let label2 = UILabel(frame: CGRect(x: 100, y: label.frame.origin.y + 60, width: 150, height: 30))
//        label2.center.x = self.view.center.x
//        label2.backgroundColor = UIColor.red
//        label2.textAlignment = NSTextAlignment.center
//        self.view.addSubview(label2)
//
//        let mutableAttributedString = NSMutableAttributedString(string: "Hello Label")
//        mutableAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSMakeRange(0, 5))
//        mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.init(name: "Chalkduster", size: 30.0) as Any, range: NSMakeRange(6, 5))
//        label2.attributedText = mutableAttributedString
//
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


extension UILabel {
    @discardableResult
    func setSpace(labelText: String, font: UIFont, lineSpace: CGFloat, worldSpace: CGFloat, width: CGFloat) -> CGFloat {
        let paraStyle = NSMutableParagraphStyle.init()
        paraStyle.lineBreakMode = NSLineBreakMode.byCharWrapping
        paraStyle.alignment = NSTextAlignment.left
        paraStyle.hyphenationFactor = 1.0
        paraStyle.firstLineHeadIndent = 0.0
        paraStyle.paragraphSpacingBefore = 0.0
        paraStyle.headIndent = 0
        paraStyle.tailIndent = 0
        
        /* 设置字间距1.5f */
        var dic = NSMutableDictionary.init()
        var oneHeight: CGFloat = 0, rowHeight: CGFloat = 0
        if worldSpace == 0 {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: 1.5]
        } else {
            let defaultText = "这样貌似解决了"
            oneHeight = (defaultText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey : Any]), context: nil).size.height
            rowHeight = (labelText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey : Any]), context: nil).size.height
            
            if rowHeight > oneHeight {
                paraStyle.lineSpacing = lineSpace
                dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: worldSpace]
            } else {
                paraStyle.lineSpacing = 0
                dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: worldSpace, NSAttributedStringKey.baselineOffset: 0]
            }
        }
        let attributedStr = NSAttributedString.init(string: labelText, attributes: (dic as! [NSAttributedStringKey : Any]))
        self.attributedText = attributedStr
        
        let size = (labelText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey: Any]), context: nil)
        return size.height
    }
    
    @discardableResult
    func getHeight(labelText: String, font: UIFont, lineSpace: CGFloat, worldSpace: CGFloat, width: CGFloat) -> CGFloat {
        let paraStyle = NSMutableParagraphStyle.init()
        paraStyle.lineBreakMode = NSLineBreakMode.byCharWrapping
        paraStyle.alignment = NSTextAlignment.left
        paraStyle.hyphenationFactor = 1.0
        paraStyle.firstLineHeadIndent = 0.0
        paraStyle.paragraphSpacingBefore = 0.0
        paraStyle.headIndent = 0
        paraStyle.tailIndent = 0
        
        /* 设置字间距1.5f */
        var dic = NSMutableDictionary.init()
        var oneHeight: CGFloat = 0, rowHeight: CGFloat = 0
        if worldSpace == 0 {
            dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: 1.5]
        } else {
            let defaultText = "这样貌似解决了"
            oneHeight = (defaultText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey : Any]), context: nil).size.height
            rowHeight = (labelText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey : Any]), context: nil).size.height
            
            if rowHeight > oneHeight {
                paraStyle.lineSpacing = lineSpace
                dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: worldSpace]
            } else {
                paraStyle.lineSpacing = 0
                dic = [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle: paraStyle, NSAttributedStringKey.kern: worldSpace, NSAttributedStringKey.baselineOffset: 0]
            }
        }
        let size = (labelText as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.RawValue(UInt8(NSStringDrawingOptions.usesLineFragmentOrigin.rawValue) | UInt8(NSStringDrawingOptions.usesFontLeading.rawValue))), attributes: (dic as! [NSAttributedStringKey: Any]), context: nil)
        return size.height
    }
}

