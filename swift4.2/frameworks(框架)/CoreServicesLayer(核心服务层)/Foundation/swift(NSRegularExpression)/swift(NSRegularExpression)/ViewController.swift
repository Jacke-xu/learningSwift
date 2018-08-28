//
//  ViewController.swift
//  swift(NSRegularExpression)
//
//  Created by 范云飞 on 2018/8/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:--------------- 常用的正则表达式 ------------------
        /* 1. 用户名 */
        /**
         ^[a-z0-9_-]{3,16}$
         */
        
        
        /* 2. 密码 */
        /**
         ^[a-z0-9_-]{6,18}$
         */
        
        /* 3. 十六进制 */
        /**
         ^#?([a-f0-9]{6}|[a-f0-9]{3})$
         */
        
        /* 4. 邮箱 */
        /**
         ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$
         */
        
        /* 5. URL */
        /**
         
         ^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$
         */
        
        /* 6. ip address */
        /**
         ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
         */
        
        /* 7. html 标签 */
        /**
         ^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$
         */
        
        /* 8. 昵称 ：用户昵称验证（允许使用4-8个汉字） */
        /**
         ^[\u{4e00}-\u{9fa5}]{4,8}$
         */
        
        
        /* 9. 用户名：用户名验证（允许使用小写字母，数字，下滑线，横杠，一共3〜16个字符） */
        /**
         ^[A-Za-z0-9]{6,20}+$
         */
        
        /* 10. 手机号 */
        /**
         ^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$
         */
        
        /* 11. 身份证号 */
        /**
         ^(\\d{14}|\\d{17})(\\d|[xX])$
         */
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension NSRegularExpression {
    
}

extension NSTextCheckingResult {
    
}
