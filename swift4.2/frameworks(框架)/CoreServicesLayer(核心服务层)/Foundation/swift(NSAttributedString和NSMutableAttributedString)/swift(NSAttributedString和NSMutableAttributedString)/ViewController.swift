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
        

        
        //MARK:********************** NSAttributedString ***************************
        
        /*
         1. NSAttributedString 的初始化方法：
         public init(string str: String)
         
         public init(string str: String, attributes attrs: [NSAttributedStringKey : Any]? = nil)
         
         public init(attributedString attrStr: NSAttributedString)
         */
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        label.center.x = self.view.center.x
        label.backgroundColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        
        let str1 = "去你大爷的吧"
        let attributedString = NSAttributedString(string: str1, attributes: [NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15)])
        label.attributedText = attributedString
        
        let label1 = UILabel(frame: CGRect(x: 100, y: label.frame.origin.y + 60, width: 100, height: 30))
        label1.center.x = self.view.center.x
        label1.backgroundColor = UIColor.black
        label1.textAlignment = NSTextAlignment.center
        self.view.addSubview(label1)
        
        let superAttributedString = NSAttributedString(attributedString: attributedString)
        let attributedText = superAttributedString
        var boldRanges: [NSRange] = []
//        attributedText.enumerateAttribute(NSAttributedStringKey.backgroundColor, in: NSRange.init(location: 0, length: (attributedText.length)), options: .longestEffectiveRangeNotRequired) { (value, range, stop) in
//            if let font = value as? UIFont {
//                if font.fontDescriptor.symbolicTraits.contains(.traitBold) {
//                    boldRanges.append(range)
//                }
//            }
//        }
        
        let range = NSRange.init(location: 0, length: 4)
        attributedText.enumerateAttributes(in: range, options: NSAttributedString.EnumerationOptions.longestEffectiveRangeNotRequired) { (color, range, stop) in
            
        }
        label1.attributedText = attributedText
        
        
        
        
        
        
        //MARK:****************** NSMutableAttributedString **********************
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

