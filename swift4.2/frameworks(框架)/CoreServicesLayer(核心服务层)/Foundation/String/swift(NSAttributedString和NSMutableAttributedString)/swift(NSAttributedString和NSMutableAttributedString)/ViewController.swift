//
//  ViewController.swift
//  swift(NSAttributedString和NSMutableAttributedString)
//
//  Created by 范云飞 on 2018/8/22.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
import Foundation
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         AttributedString可以分为NSAttributedString和NSMutableAttributedString两种。
         在使用中通过将AttributedString赋值给控件的 attributedText 属性来添加文字样式。
         可设置的控件有UILabel、UITextField和UITextView。
         
         目前封装比较好的框架:https://github.com/ibireme/YYKit（富文本的显示和编辑）
         原理讲解的博客:  https://imtangqi.com/2016/02/18/the-notes-of-learning-text-kit/
                        http://ggghub.com/2015/10/26/iOS%E5%AF%8C%E6%96%87%E6%9C%AC%EF%BC%88%E4%B8%80%EF%BC%89%E5%B1%9E%E6%80%A7%E5%8C%96%E5%AD%97%E7%AC%A6%E4%B8%B2/
         */
        
    //MARK:----------------------- UILabel(主要用来展示富文本) -----------------------------------
        
        //MARK:<------ NSAttributedString ----->
        
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
        
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.width.lessThanOrEqualTo(self.view.frame.size.width - 40)
        }
        
        /* 单行测试 */
//        let str1 = """
//AttributedString
//"""
        
        /* 多行测试 */
        let str1 = """
AttributedString可以分为NSAttributedString和NSMutableAttributedString两种。在使用中通过将AttributedString赋值给控件的 attributedText 属性来添加文字样式。可设置的控件有UILabel、UITextField和UITextView,☺☺是不是很强大🌹
"""
        
        //MARK:---- 一般情况下的UILabel高度自适应的处理办法
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
        
        //MARK:---- 进一步优化的处理方法
        
        label.setSpace(labelText: str1, font: UIFont.boldSystemFont(ofSize: 15), lineSpace: 2.5, worldSpace: 1.5, width: self.view.frame.size.width - 40)
        
        
        //MARK:<------ NSMutableAttributedString ------>
        let label2 = UILabel.init()
        label2.center.x = self.view.center.x
        label2.backgroundColor = UIColor.red
        label2.numberOfLines = 0
        label2.textAlignment = NSTextAlignment.center
        self.view.addSubview(label2)
        
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(30)
            make.left.equalTo(20)
            make.width.lessThanOrEqualTo(self.view.frame.size.width - 40)
//            make.height.equalTo(30)
        }

        

        let mutableAttributedString = NSMutableAttributedString(string: "Hello Label")
        mutableAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.blue, range: NSMakeRange(0, 5))
        mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: UIFont.init(name: "Chalkduster", size: 30.0) as Any, range: NSMakeRange(6, 5))
        label2.attributedText = mutableAttributedString


    }
    
    //MARK:----------------------- UITextField/UITextView(主要用来编辑富文本上传服务器) --------------------------------

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


extension UILabel {
    
    func setSpace(labelText: String, font: UIFont, lineSpace: CGFloat, worldSpace: CGFloat, width: CGFloat) -> Void {
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
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: size.width, height: size.height)
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

