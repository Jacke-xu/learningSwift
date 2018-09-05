//
//  ViewController.swift
//  swift(Number)
//
//  Created by 范云飞 on 2018/9/3.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:-------------------- NSRange -------------------------
        /**
         参考资料： https://developer.apple.com/documentation/foundation/nsrange
         */
        
        //MARK:----- 1. 初始化
        let range = NSRange(location: 10, length: 10)
        print("range is \(range)")
        
        //MARK:----- 2. func NSEqualRanges(_ range1: NSRange, _ range2: NSRange) -> Bool
        /**
         返回一个Boolean值， 判断两个给定的NSRange是否相等（range1 和 range2 是否具有相同的位置和长度）
         */
        let range1 = NSRange(location: 10, length: 12)
        print("NSEqualRanges(range, range1) is \(NSEqualRanges(range, range1))")
        
        //MARK:----- 3. func NSIntersectionRange(_ range1: NSRange, _ range2: NSRange) -> NSRange
        /**
         返回range1 和 range2 的交集
         */
        
        let intersectionRange = NSIntersectionRange(range, range1)
        print("intersectionRange is \(intersectionRange)")
        
        
        //MARK:----- 5. func NSLocationInRange(_ loc: Int, _ range: NSRange) -> Bool
        /**
         返回一个Boolean值， 判断给定的位置是否在给定的范围内
         */
        
        print("NSLocationInRange(19, range) is \(NSLocationInRange(20, range))")
        
        
        //MARK:----- 6. func NSMakeRange(_ loc: Int, _ len: Int) -> NSRange
        /**
         根据指定的值创建一个新的NSRange
         */
        
        let makeRange = NSMakeRange(10, 20)
        print("makeRange is \(makeRange)")
        
        
        //MARK:----- 7. func NSMaxRange(_ range: NSRange) -> Int
        /**
         返回NSRange 的位置和长度的总和
         */
        let locLength = NSMaxRange(range1)
        print("locLength is \(locLength)")
        
        
        //MARK:----- 8. func NSRangeFromString(_ aString: String) -> NSRange
        /**
         返回文本表示的范围
         */
        let textString = "3345fan333lll66" // { 3345, 333}
        //let textString = "qunidayede"      // { 0, 0 }
        //let textString = "11fan"           // { 11, 0 }
        let textRange = NSRangeFromString(textString)
        print("textRange is \(textRange)")
        //FIXME:扫描两个整数，按顺序用作位置和长度值，以创建结构。如果只包含一个整数，则将其用作位置值。如果不包含任何整数，则此函数返回其位置和长度值均为0的结构
        
        //MARK:----- 9. func NSStringFromRange(_ range: NSRange) -> String
        /**
         返回范围的字符串表示形式
         */
        
        let fromRangeString = NSStringFromRange(range1)
        print("fromRangeString is \(fromRangeString)")
        
        //FIXME:字符串形式为 "{a, b}", 其中形式是非负整数表示
        
        
        //MARK:----- 10. func NSUnionRange(_ range1: NSRange, _ range2: NSRange) -> NSRange
        /**
         返回指定范围的并集
         */
        
        let unionRange = NSUnionRange(range1, range)
        print("unionRange is \(unionRange)")
        
        //FIXME:一系列涵盖所有指数中之间range1 和 range2。如果一个范围完全包含在另一个范围内，则返回的范围等于更大的范围
        
        //MARK:----- 11. typeealias NSRangePointer = UnsafeMutablePointer<NSRange>
        /**
         指示参数的类型是指向NSRange 结构的指针
         */
        
        //MARK:----- 12. let NSNotFound: Int
        /**
         一个值，表示无法找到或不存在所请求的项目
         */
        //FIXME:NSNotFound 通常由各种方法和函数使用，这个方法和函数搜索串行数据中的项并返回索引，例如：字符串对象中的字符或id对象中的NSArray对象
        
        
        //MARK:-------------------- Decimal -------------------------
        
        
        //MARK:-------------------- NSDecimalNumber -----------------
        
        //MARK:-------------------- NSGeometry ----------------------
        
        //MARK:-------------------- CGFloat -------------------------
        
        //MARK:-------------------- AffineTransform -----------------
        
        //MARK:-------------------- NSNumber ------------------------
        
        //MARK:-------------------- NSCFBoolean ---------------------
        
        //MARK:-------------------- NSConcreteValue -----------------
        
        //MARK:-------------------- NSSpecialValue ------------------
        
        //MARK:-------------------- NSValue -------------------------
        
        //MARK:-------------------- NSMeasurement -------------------
        
        //MARK:-------------------- Unit ----------------------------
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

