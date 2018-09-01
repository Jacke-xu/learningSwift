//
//  ViewController.swift
//  swift(Scanner)
//
//  Created by 范云飞 on 2018/8/30.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FIXME: Scanner: 一个字符串解析器，用于扫描字符集中的字符串或字符，以及以十进制，十六进制和浮点形式表示的数值



        //MARK:---------------- 创建扫描仪 -----------------
        //MARK:----- class func localizedScanner(with: String) -> Any 和 init(string: String)
        /**
         如下面：十六进制颜色扩充的例子
         #DC143C
         #FF1493
         */
        
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        view.backgroundColor = UIColor.init(hex: "#DC143C")
        self.view.addSubview(view)
        
        let view1 = UIView(frame: CGRect(x: 100, y: view.frame.maxY + 20, width: 100, height: 40))
        view1.backgroundColor = UIColor.init(hex: "#FF1493")
        self.view.addSubview(view1)
        
        
        
        
        //MARK:---------------- 获取扫描仪的字符串 -------------
        //MARK:----- var string : String { get }
        /**
         var string: String { get }
         */
        let scanner = Scanner(string: "qunidayede")
        print("scanner.string is \(scanner.string)")
        
        
        
        //MARK:---------------- 配置扫描仪 -----------------
        //MARK:----- var scanLocation: Int { get set }
        /**
         scanner 当前的扫描位置，初始化完成后默认是0，这个值会随着扫描方法的调用而变化
         */
        let scannerLocation = Scanner(string: "32jingki")
        while !scannerLocation.isAtEnd{ // 判断是否扫描到最后
            scannerLocation.scanLocation += 1
            print(scannerLocation.scanLocation)
        }
        print(scannerLocation.locale as Any)

        //MARK:----- var caseSensitive: Bool { get set }
        /**
         是否大小写敏感（默认不区分大小写），初始化scanner的时候设置 true回区分大小写， 设置false不区分大小写
         */
        
        //MARK:----- var charactersToBeSkipped: CharacterSet? { get set }
        /**
         在扫描检查之前，将要跳过的字符集（默认的是跳过空格和换行符）
         */
        
        let hyphen = CharacterSet(charactersIn: "-")
        
        let tele = "151-8888-6666"
        let scannerSkip = Scanner(string: tele)
        scannerSkip.charactersToBeSkipped = hyphen
        
        var code1, code2, code3 : NSString?
        scannerSkip.scanUpToCharacters(from: hyphen, into: &code1)
        scannerSkip.scanUpToCharacters(from: hyphen, into: &code2)
        scannerSkip.scanUpToCharacters(from: hyphen, into: &code3)
        
        print(" code1 is \(code1 ?? "nil"), \n code2 is \(code2 ?? "nil"), \n code3 is \(code3 ?? "nil")")
        
        //MARK:----- var locale: Any? { get set }
        /**
         设置扫描区域
         */
        
        
        
        //MARK:---------------- 扫描字符和字符串 ------------
        //MARK:----- func scanCharacters(from: CharacterSet, into: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
        /**
         只要遇到来自给定字符集的字符，就扫描字符串，将字符累积到通过引用返回的字符串中
         */
        
        var result: NSString?
        
        let characterset = CharacterSet(charactersIn: "@gmail")
        let scannerCharacters = Scanner(string: "fyf786452470@gmail.com")
//        scannerCharacters.charactersToBeSkipped = characterset
        
        //默认的扫描位置为0
        scannerCharacters.scanLocation = 12
        while scannerCharacters.scanCharacters(from: characterset, into: &result) {
            print("result is \(result ?? "nil")")
        }
        //FIXME:使用scanCharacters 不能设置 charactersToBeSkipped
        //FIXME:从当前的扫描位置开始扫描，判断扫描字符串是否从当前位置能扫描到和传入字符串相同的一串字符，如果能扫描到就返回YES,指针指向的地址存储的就是这段字符串的内容。例如scanner的string内容为123abc678,传入的字符串内容为abc，如果当前的扫描位置为0，那么扫描不到，但是如果将扫描位置设置成3，就可以扫描到了
        
        
        //MARK:----- func scanUpToCharacters(from set: CharacterSet,into result: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
        /**
         扫描字符串，直到遇到来自给定字符集的字符，将字符累积到通过引用返回的字符串中
         */
        var result1: NSString?
        scannerCharacters.scanLocation = 0
        while scannerCharacters.scanUpToCharacters(from: characterset, into: &result1) {
            print("result1 is \(result1 ?? "nil")")
        }
        //FIXME:从当前的扫描位置开始扫描，扫描到和传入的字符串相同字符串时，停止，指针指向的地址存储的是遇到传入字符串之前的内容。例如scanner的string内容为123abc678,传入的字符串内容为abc，存储的内容为123.注意:存储的是本次扫描开始到扫描结束的之间的字符
        
        
        //MARK:----- func scanString(_ string: String, into result: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
        /**
         扫描给定的字符串，如果找到匹配则通过引用返回等效的字符串对象
         */
        let string = ".com"
        var result2: NSString?
        
        let scannerString = Scanner(string: "fyf786452470@gmail.com")
        scannerString.scanLocation = "fyf786452470@gmail".count
        while scannerString.scanString(string, into: &result2) {
            print("result2 is \(result2 ?? "nil")")
        }
        
        //FIXME:从当前的扫描位置开始扫描，判断扫描字符串是否从当前位置能扫描到和传入字符串相同的一串字符，如果能扫描到就返回YES,指针指向的地址存储的就是这段字符串的内容。例如scanner的string内容为123abc678,传入的字符串内容为abc，如果当前的扫描位置为0，那么扫描不到，但是如果将扫描位置设置成3，就可以扫描到了
        
        //MARK:----- func scanUpTo(_ String, into: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool
        /**
         扫描字符串知道遇到给定的字符串，将字符累积到由引用返回的字符串中
         */
        let string1 = "l"
        var result3: NSString?
        let scannerUpTo = Scanner(string: "@gmail")
        while scannerUpTo.scanUpTo(string1, into: &result3) {
            print("result3 is \(result3 ?? "nil")")
        }
        
        
        
        //MARK:---------------- 扫描数值 -------------------
        //MARK:----- func scanDecimal(_ dcm: UnsafeMutablePointer<Decimal>?) -> Bool
        /**
         扫描NSDecimal值，通过引用返回找到的值
         */
        var decimal: Decimal = 0.0
        let scannerDecimal = Scanner.init(string: "100")
        while scannerDecimal.scanDecimal(&decimal) {
            print("decimal is \(decimal)")
        }
        
        //MARK:----- func scanDouble(_ result: UnsafeMutablePointer<Double>?) -> Bool
        /**
         扫描double值，通过引用返回找到的值
         */
        var double: Double = 0.0
        let scannerDouble = Scanner(string: "10.23")
        while scannerDouble.scanDouble(&double) {
            print("double is \(double)")
        }
        
        
        //MARK:----- func scanFloat(_ result: UnsafeMutablePointer<Float>?) -> Bool
        /**
         扫描浮点值，通过引用返回找到的值
         */
        var float: Float = 0.0
        let scannerFloat = Scanner(string: "18")
        while scannerFloat.scanFloat(&float) {
            print("float is \(float)")
        }
        
        //MARK:----- func scanHexDouble(_ result: UnsafeMutablePointer<Double>?) -> Bool
        /**
         从十六进制表示扫描double值，通过引用返回找到的值
         */
        var hexDouble: Double = 0.00
        let scannerHexDouble = Scanner(string: "0x9912")
        while scannerHexDouble.scanHexDouble(&hexDouble) {
            print("hexDouble is \(hexDouble)")
        }
     

        //MARK:----- func scanHexFloat(_ result: UnsafeMutablePointer<Float>?) -> Bool
        /**
         从十六进制表示扫描Float值，通过引用返回找到的值
         */
        var hexFloat: Float = 0.00
        let scannerHexFloat = Scanner(string: "0xDC")
        while scannerHexFloat.scanHexFloat(&hexFloat) {
            print("hexFloat is \(hexFloat)")
        }
        

        //MARK:----- func scanHexInt32(_ result: UnsafeMutablePointer<UInt32>?) -> Bool
        /**
         从十六进制表示扫描无符号值，通过引用返回找到的值
         */
        var r : UInt32 = 0, g : UInt32 = 0, b : UInt32 = 0
        let rHex = "34", gHex = "88", bHex = "90"
        /* 创建扫描仪，将字符串的扫描结果赋值给r, g, b */
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        print(" r is \(r), \n g is \(g), \n b is \(b)")
        
        
        //MARK:----- func scanHexInt64(_ result UnsafeMutablePointer<UInt64>?) -> Bool
        /**
         从十六进制表示中扫描场long值，通过引用返回找到的值
         */
        
        var uint64: UInt64 = 0
        let scannerHexUInt64 = Scanner(string: "0xDC32")
        while scannerHexUInt64.scanHexInt64(&uint64) {
            print("uint64 is \(uint64)")
        }
        
        
        //MARK:----- func scanInt(_ result UnsafeMutablePointer<Int>?) -> Bool
        /**
         从十进制表示扫描NSInteger值，通过引用返回找到的值
         */
        var int : Int = 0
        let scannerInt = Scanner(string: "xx987")
        scannerInt.scanLocation = 2
        scannerInt.scanInt(&int)
        print("int is \(int)")
        
        
        
        //MARK:----- func scanInt32(_ result UnsafeMutablePointer<Int32>?) -> Bool
        /**
         从十进制表示扫描NSInteger值，通过引用返回找到的
         */
        var int32: Int32 = 0
        let scannerInt32 = Scanner(string: "128.09")
        while scannerInt32.scanInt32(&int32) {
            print("int32 is \(int32)")
        }
        
        
        
        //MARK:----- func scanInt64(_ result UnsafeMutablePointer<Int64>?) -> Bool
        /**
         从十进制表示扫描长的long值，通过引用返回找到的值
         */
        var int64: Int64 = 0
        let scannerInt64 = Scanner(string: "112.333")
        while scannerInt64.scanInt64(&int64) {
            print("int64 is \(int64)")
        }
        
        //MARK:----- func scanUnsignedLongLong(_ result UnsafeMutablePointer<UInt64>?) -> Bool
        /**
         从十进制表示中扫描无符号长long值，通过引用返回找到的值
         */
        var unsignedLongLong: CUnsignedLongLong = 0
        let scannerUnsignedLongLong = Scanner(string: "1290.90")//可以尝试-1290.90 看看什么结果
        while scannerUnsignedLongLong.scanUnsignedLongLong(&unsignedLongLong) {
            print("unsignedLongLong is \(unsignedLongLong)")
        }
        
        //MARK:---------------- 监听扫描进度 -------------------
        //MARK:----- var isAtEnd: Bool { get }
        /**
         表示接收方是否已用尽所有重要字符的标志
         */
//        let scanner1 = Scanner(string: "32jingki")
//        while !scanner1.isAtEnd{ // 判断是否扫描到最后
//            scanner1.scanLocation += 1
//            print(scanner1.scanLocation)
//        }
//        print(scanner1.locale as Any)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension UIColor {
    
    /**
     十六进制颜色扩充
     */
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        /* 1. 判断字符串长度是否符合 */
        guard hex.count >= 6 else {
            return nil
        }
        
        /* 2. 将字符串转成大写 */
        var tempHex = hex.uppercased()
        
        /* 3. 判断开头 */
        if tempHex.hasPrefix("0x") || tempHex.hasPrefix("##") || tempHex.hasPrefix("0X") {
            //去掉开头
            tempHex = String(tempHex.dropFirst(2))
        }
        if tempHex.hasPrefix("#") {
            tempHex = String(tempHex.dropFirst())
        }
        
        /* 4. 分别截取RGB */
        var range = NSRange(location: 0, length: 2)
        let rHex = (tempHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tempHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tempHex as NSString).substring(with: range)
        
        /* 5. 将字符串转化成数字， emoji也是十六进制表示（此处也可用Float类型） */
        var r : UInt32 = 0, g : UInt32 = 0, b : UInt32 = 0
        /* 创建扫描仪，将字符串的扫描结果赋值给r, g, b */
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
    
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
    }
    
    /**
     RGB三原色
     */
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, alpha : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
}


