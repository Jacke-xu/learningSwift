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
        //MARK:-------------- 常用的正则表达式 ------------------
        print("--------------- 常用的正则表达式 ------------------")
        //MARK:  /* 1. 用户名 */
        /**
         ^[a-z0-9_-]{3,16}$
         */
        let userName = "fyf786452470"
        print("userName is \(userName.isValidUserName())")
     
        
        //MARK:  /* 2. 密码 */
        /**
         ^[a-z0-9_-]{6,18}$
         */
        let password = "fyf786452470"
        print("password is \(password.isValidPassword())")
        
        //MARK:  /* 3. 邮箱 */
        /**
         ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$
         */
        let email = "ios_developing@163.com"
        print("email is \(email.isValidEmail())")
        
        //MARK:  /* 4. URL */
        /**
         ^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$
         */
        
        let url = "https://www.baidu.com"
        print("url is \(url.isValidUrl())")
        
        //MARK:  /* 5. ip address */
        /**
         ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
         */
        let ipAddress = "192.168.2.3"
        print("ipAddress is \(ipAddress.isValidIpAdress())")
        
        //MARK:  /* 6. html 标签 */
        /**
         ^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$
         */
        let html = "<p></p>"
        print("html is \(html.isValidHtml())")
        
        //MARK:  /* 7. 昵称 ：用户昵称验证（允许使用4-8个汉字） */
        /**
         ^[\u{4e00}-\u{9fa5}]{4,8}$
         */
        let nickName = "说能叫我布朗"
        print("nickName is \(nickName.isValidNickName())")
        
        
        //MARK:  /* 8. 用户名：用户名验证（允许使用小写字母，数字，下滑线，横杠，一共3〜16个字符） */
        /**
         ^[A-Za-z0-9]{6,20}+$
         */
        
        //MARK:  /* 9. 手机号 */
        /**
         ^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$
         
         */
        
        let telenumber = "15137162459"
        print("telenumber is \(telenumber.isValidTelephoneNumber())")
        
        //MARK:  /* 10. 身份证号 */
        /**
         ^(\\d{14}|\\d{17})(\\d|[xX])$
         */
        let id = "41272819920901493X"
        print("id is \(id.isValidId())")
        
        
        
        //MARK:-------------- 基本用法 ------------------
        
        print("--------------- 基本用法 ------------------")
        let letters = "abcdefg"
        let pattern = "[a, b, c]"
        let regularEx = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        /**
         regularEx is <NSRegularExpression: 0x600000443000> [a, b, c] 0x1
         */
        
        //为了获得支持所有字符累心的准确范围长度，必须将输入字符串转换为NSString
        let nsString = letters as NSString
        
        let matches = regularEx?.matches(in: letters, options: [], range: NSMakeRange(0, nsString.length))
        /**
         (lldb) po matches
         ▿ Optional<Array<NSTextCheckingResult>>
         ▿ some : 3 elements
         - 0 : <NSSimpleRegularExpressionCheckingResult: 0x60000027f380>{0, 1}{<NSRegularExpression: 0x600000443000> [a, b, c] 0x1}
         - 1 : <NSSimpleRegularExpressionCheckingResult: 0x60000027f3c0>{1, 1}{<NSRegularExpression: 0x600000443000> [a, b, c] 0x1}
         - 2 : <NSSimpleRegularExpressionCheckingResult: 0x60000027f400>{2, 1}{<NSRegularExpression: 0x600000443000> [a, b, c] 0x1}
         */
        
        let output = matches?.map { nsString.substring(with: $0.range) }
        /**
         (lldb) po output
         ▿ Optional<Array<String>>
         ▿ some : 3 elements
         - 0 : "a"
         - 1 : "b"
         - 2 : "c"
         */
        
        
        /* 为安全匹配模式，应将其包含在do catch 块中以处理故障 */
        
        let numbers = "121314"
        let pattern1 = "1[2,3]"
        do {
            let regEx = try? NSRegularExpression(pattern: pattern1, options: [])
            /**
             regEx is Optional(<NSRegularExpression: 0x600000255750> 1[2,3] 0x0)
             */
            
            let nsString1 = numbers as NSString
            let matches1 = regEx?.matches(in: numbers, options: [], range: NSMakeRange(0, nsString1.length))
            /**
             (lldb) po matches1
             ▿ Optional<Array<NSTextCheckingResult>>
             ▿ some : 2 elements
             - 0 : <NSSimpleRegularExpressionCheckingResult: 0x600000469b00>{0, 2}{<NSRegularExpression: 0x600000255750> 1[2,3] 0x0}
             - 1 : <NSSimpleRegularExpressionCheckingResult: 0x600000469bc0>{2, 2}{<NSRegularExpression: 0x600000255750> 1[2,3] 0x0}
             */
            
            let output1 = matches1?.map { nsString1.substring(with: $0.range) }
            /**
             (lldb) po output1
             ▿ Optional<Array<String>>
             ▿ some : 2 elements
             - 0 : "12"
             - 1 : "13"
             */
        } catch let error as NSError {
            print("matching failed \(error)")
        }
        
        
        
        //MARK:-------------- 扩展String类型进行常用匹配 ------------------
        /* 下面 extension String */
        
        
        
        
        //MARK:-------------- 替换子字符串 ------------------------------
        let money = "¢¥€£$¥€£¢"
        let pattern2 = "¢"
        do {
            let regEx1 = try? NSRegularExpression(pattern: pattern2, options: [])
            /**
             regEx1 is Optional(<NSRegularExpression: 0x600000441b30> ¢ 0x0)
             */
            
            let nsString2 = money as NSString
            let range = NSMakeRange(0, nsString2.length)
            let correct$ = regEx1?.stringByReplacingMatches(in: money, options: .withTransparentBounds, range: range, withTemplate: "fanyunfei")
            /**
             (lldb) po correct$
             ▿ Optional<String>
             - some : "fanyunfei¥€£$¥€£fanyunfei"
             */
            
        } catch let error as NSError {
            print("matching failed \(error)")
        }
        
        
        //MARK:-------------- 匹配特殊字符，应使用双反斜杠 \. becomes \\.------------------
        /* (){}[]/\+*$>.|^? */
        let specials = "(){}[]"
        let pattern3 = "(\\(|\\{|\\[)"
        do {
            let regEx4 = try? NSRegularExpression(pattern: pattern3, options: [])
            /**
             regEx4 is <NSRegularExpression: 0x604000458b70> (\(|\{|\[) 0x0
             */
            let nsString3 = specials as NSString
            let matches2 = regEx4?.matches(in: specials, options: [], range: NSMakeRange(0, nsString3.length))
            /**
             (lldb) po matches2
             ▿ Optional<Array<NSTextCheckingResult>>
             ▿ some : 3 elements
             - 0 : <NSSimpleRegularExpressionCheckingResult: 0x60400026db40>{0, 1}{<NSRegularExpression: 0x6040002443b0> (\(|\{|\[) 0x0}
             - 1 : <NSSimpleRegularExpressionCheckingResult: 0x60400026dbc0>{2, 1}{<NSRegularExpression: 0x6040002443b0> (\(|\{|\[) 0x0}
             - 2 : <NSSimpleRegularExpressionCheckingResult: 0x60400026dc00>{4, 1}{<NSRegularExpression: 0x6040002443b0> (\(|\{|\[) 0x0}
             */
            let output2 = matches2?.map { nsString3.substring(with: $0.range) }
            /**
             (lldb) po output2
             ▿ Optional<Array<String>>
             ▿ some : 3 elements
             - 0 : "("
             - 1 : "{"
             - 2 : "["
             */

        } catch let error as NSError {
            print("matching failed \(error)")
        }
        
        //MARK:-------------- 自定义 ------------------
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let matcher: RegexHelper
        do {
            matcher = try! RegexHelper(mailPattern)
        }
        
        let maybeMailAddress = "fyf786452470@gmail.com"
        if matcher.match(input: maybeMailAddress) {
            print("有限的邮箱地址")
        }
        
        print(try! RegexHelper("^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$").match(input: "www.baidu.com"))
        
        
        
        //MARK:----------------- NSTextCheckResult ----------------
        /**
         在分析文本块期间发现的文本内容的出现，例如匹配正则表达式时。
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension String {
    
    //MARK:  /* 1. 用户名 */
    /**
     ^[a-z0-9_-]{3,16}$
     */
    func isValidUserName() -> Bool {
        let userNameRegEx = "^[a-z0-9_-]{3,16}$"
        let userNameTest = NSPredicate(format: "SELF MATCHES %@", userNameRegEx)
        return userNameTest.evaluate(with: self)
    }
    
    //MARK:  /* 2. 密码 */
    /**
     ^[a-z0-9_-]{6,18}$
     */
    func isValidPassword() -> Bool {
        let passwordRegEx = "^[a-z0-9_-]{6,18}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: self)
    }
    
    //MARK:  /* 3. 邮箱 */
    /**
     ^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$
     */

    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    //MARK:  /* 4. URL */
    /**
     
     ^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$
     */
    func isValidUrl() -> Bool {
        let urlRegEx = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
        let urlTest = NSPredicate(format: "SELF MATCHES %@", urlRegEx)
        return urlTest.evaluate(with: self)
    }
    
    //MARK:  /* 5. ip address */
    /**
     ^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$
     */
    func isValidIpAdress() -> Bool {
        let ipAddressRegEx = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        let ipAddressTest = NSPredicate(format: "SELF MATCHES %@", ipAddressRegEx)
        return ipAddressTest.evaluate(with: self)
    }
    
    //MARK:  /* 6. html 标签 */
    /**
     ^<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+\/>)$
     */
    func isValidHtml() -> Bool {
        let htmlRegEx = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"
        let htmlTest = NSPredicate(format: "SELF MATCHES %@", htmlRegEx)
        return htmlTest.evaluate(with: self)
    }
    
    //MARK:  /* 7. 昵称 ：用户昵称验证（允许使用4-8个汉字） */
    /**
     ^[\u{4e00}-\u{9fa5}]{4,8}$
     */
    func isValidNickName() -> Bool {
        let nickNameRegEx = "^[\u{4e00}-\u{9fa5}]{4,8}$"
        let nickNameTest = NSPredicate(format: "SELF MATCHES %@", nickNameRegEx)
        return nickNameTest.evaluate(with: self)
    }
    
    //MARK:  /* 8. 用户名：用户名验证（允许使用小写字母，数字，下滑线，横杠，一共3〜16个字符） */
    /**
     ^[A-Za-z0-9]{6,20}+$
     */
//    func isValidUserName() -> Bool {
//        let userNameRegEx = "^[A-Za-z0-9]{6,20}+$"
//        let userNameTest = NSPredicate(format: "SELF MATCHES %@", userNameRegEx)
//        return userNameTest.evaluate(with: self)
//    }
    
    //MARK:  /* 9. 手机号 */
    /**
     ^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$
     */
    func isValidTelephoneNumber() -> Bool {
        let telephoneNumberRegEx = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
        let telephoneNumberTest = NSPredicate(format: "SELF MATCHES %@", telephoneNumberRegEx)
        return telephoneNumberTest.evaluate(with: self)
    }
    
    //MARK:  /* 10. 身份证号 */
    /**
     ^(\\d{14}|\\d{17})(\\d|[xX])$
     */
    func isValidId() -> Bool {
        let idRegEx = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let idTest = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: self)
    }
    
}


struct RegexHelper {
    let regex: NSRegularExpression
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.count))
        return matches.count > 0
    }
}


