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
        
        //MARK:**************************** NSRange ****************************
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
        
        
        //MARK:**************************** Decimal ******************************
        //MARK:----- 1. 创建一个空的十进制
        let emptyDecimal = Decimal.init()
        print("emptyDecimal is \(emptyDecimal.description)")
        
        //MARK:----- 2. 从组建创建十进制
        //MARK:init(sign: FloatingPointeSign, exponent: Int, significand: Decimal)
        /**
         * FloatingPointSign:
         
         public enum FloatingPointSign : Int {
             case plus
             case minus
         public static func != (lhs: FloatingPointSign, rhs: FloatingPointSign) -> Bool
         }
         
         * exponent: 指数
         
         * significand: 有效位数
         */
        
        let componentDecimal = Decimal.init(sign: .plus, exponent: 2, significand: 80)
        print("componentDecimal is \(componentDecimal)")
        
        //MARK:init(_exponent: Int32, _length: UInt32, _isNegative: UInt32, _isCompact: UInt32, _reserved: UInt32, _mantissa: (UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16))
        
        /**
         根据提供的特征创建初始化的小数
         
         _exponent: 指数
         _length: 长度
         _isNegative: 是否为负
         _isCompact: 是否紧凑
         _reserved: 储备
         _mantissa: 尾数
         
         */
        let componentDecimal1 = Decimal.init(_exponent: 1, _length: 1, _isNegative: 0, _isCompact: 0, _reserved: 1, _mantissa: (1, 2, 3, 4, 5, 6, 7, 8))
        print("componentDecimal1 is \(componentDecimal1)")//
        
        //MARK:----- 3. 从浮点数创建十进制
        
        //MARK:init(_ value: Double)
        let doubleDecimal = Decimal.init(15.09)
        print("doubleDecimal is \(doubleDecimal)")
        
        //MARK:init(floatLiteral value: Double)
        let floatDecimal = Decimal.init(floatLiteral: -23.4)
        print("floatDecimal is \(floatDecimal)")
        
        
        //MARK:----- 4. 从整数创建十进制
        //MARK:init?<T>(exactly source: T) where T : BinaryInteger
        /**
         创建一个精确表示提供的整数的新十进制值
         */
        
        //MARK:init(_ value: Int)
        /**
         使用提供的整数值创建并初始化小数
         */
        let intDecimal = Decimal.init(20)
        print("intDecimal is \(intDecimal)")
        
        
        //MARK:init(_ value: Int8)
        /**
         使用提供的整数值创建并初始化小数
         */
        let int8Decimal = Decimal.init(100)
        print("int8Decimal is \(int8Decimal)")
        
        //MARK:init(_ value: Int16)
        /**
         使用提供的整数值创建并初始化小数
         */
        
        //MARK:init(_ value: Int32)
        /**
         使用提供的整数值创建并初始化小数
         */
        
        //MARK:init(_ value: Int64)
        /**
         使用提供的整数值创建并初始化小数
         */
        
        //MARK:init(integerLiteral value: Int)
        /**
         使用提供的整数值创建并初始化小数
         */
        

        //MARK:----- 5. 从无符号整数创建十进制
        //MARK:init(_ value: UInt)
        /**
         使用无符号整数值创建并初始化小数
         */
        
        //MARK:init(_ value: UInt8)
        /**
         使用无符号整数值创建并初始化小数
         */
        
        //MARK:init(_ value: UInt16)
        /**
         使用无符号整数值创建并初始化小数
         */
        
        //MARK:init(_ value: UInt32)
        /**
         使用无符号整数值创建并初始化小数
         */
        
        //MARK:init(_ value: UInt64)
        /**
         使用无符号整数值创建并初始化小数
         */
        
        
        //MARK:----- 6. 从另一个小数创建一个小数
        //MARK:init(signOf: Decimal, magnitudeOf magnitude: Decimal)
        /**
         使用给定小数的符号和大小创建并初始化小数
         */
        
        let decimal = Decimal.init(signOf: 0, magnitudeOf: 0.08)
        print("decimal is \(decimal)")
        
        //MARK:func NSDecimalCopy(_ destination: UnsafeMUtablePointer<Decimal>, _ source: UnsafePointer<Decimal>)
        
        /**
         复制十进制数的值， 将值复制source 到destination
         */
        let des = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        des.pointee = 30
        let source = UnsafePointer<Decimal>.init(des)
        let destination = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        destination.pointee = 200
        print(source.pointee)
        
        NSDecimalCopy(destination, source)
        print("source is \(source.pointee)")
        print("destination is \(destination.pointee)")
        
        //MARK:------ 7. 在小数和字符串之间转换
        //MARK:init?(string: String, locale: Locale? = default)
        /**
         通过解释提供的字符串来创建和初始化小数
         */
        let stringDecimal = Decimal.init(string: "1234er")
        print("stringDecimal is \(String(describing: stringDecimal))")
        
        //MARK:func NSDecimalString(_ dcm: UnsafePointer<Decimal>, _ locale: Any?) -> String
        /**
         返回适合指定语言环境的十进制值的字符串表示形式
         */
        let locale = NSLocale.autoupdatingCurrent
        let stringResult = NSDecimalString(destination, locale)
        print("stringResult is \(stringResult)")
        
        
        //MARK:----- 8. 执行算术
        //MARK:static func * (lhs: Decimal, rhs: Decimal) -> Decimal
        /**
         将两个十进制数相乘
         */
        
        //MARK:static func *= (lhs: inout Decimal, rhs: Decimal)
        /**
         将两个十进制数相乘，将结果储存在第一个数字中
         */
        
        //MARK: static func + (lhs: Decimal, rhs: Decimal) -> Decimal
        /**
         将两个十进制数相加
         */
        
        //MARK:static func - (lhs: Decimal, rhs: Decimal) -> Decimal
        /**
         将两个十进制数相减
         */
        
        //MARK:static func += (lhs: inout Decimal, rhs: Decimal)
        /**
         将两个十进制数相加，并把结果保存在第一个数中
         */
        
        //MARK:static func -= (lhs: inout Decimal, rhs: Decimal)
        /**
         将两个十进制数相减，将结果存储在第一个数字中
         */
        
        //MARK:static func / (lhs: Decimal, rhs: Decimal) -> Decimal
        /**
         将一个十进制数除以另一个十进制数
         */
        
        //MARK:static func / (lhs: inout Decimal, rhs: Decimal)
        /**
         讲一个十进制数除以另一个十进制数，将结果存储在第一个数字中
         */
        
        //MARK:func pow(_ x: Decimal, _ y: Int) -> Decimal
        /**
         返回提升到给定功率的十进制数
         */
        
        let powDecimal = pow(10, 9)
        print("powDecimal is \(powDecimal)")//1000000000
        
        //MARK:mutating func negate()
        
        /**
         否定此小数
         */
        var negateDecimal  = 10
        negateDecimal.negate()
        print("negateDecimal is \(negateDecimal)")
        
        
        //MARK:----- 9. 使用引用执行算术
        //MARK:func NSDecimalCompact(_ number: UnsafeMutablePointer<Decimal>)
        /**
         压缩十进制结构以提高效率
         */
        
        let compactDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 10)
        compactDecimal.pointee = 100
        print(compactDecimal)
        NSDecimalCompact(compactDecimal)
        print("compactDecimal is \(compactDecimal)")
        /**
         使用它进行计算将占用尽可能少的内存。所有的NSDecimal...  算术函数都需要紧凑的Decimal参数
         */
        
        
        //MARK:func NSDecimalAdd(_ result: UnsafeMutablePointer<Decimal>, _ leftOperand: UnsafePointer<Decimal>, _ rightOperand: UnsafePointer<Decimal>, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         两个十进制数相加, 并将leftOperand 和 rightOperand 相加的结果存储在result中
         */
        
        let addDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        
        let addDecimal1 = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        addDecimal1.pointee = 230
        
        let addDecimal2 = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        addDecimal2.pointee = 300.00106
        
        let calculationError = NSDecimalAdd(addDecimal, addDecimal2, addDecimal1, .down)
        print("calculationError is \(calculationError.rawValue)")
        print(" addDecimal is \(addDecimal.pointee), \n addDecimal1 is \(addDecimal1.pointee), \n addDecimal2 is \(addDecimal2.pointee)")
        // CalculationError: 用于描述错误的计算常量
        
        //MARK:func NSDecimalSubtract(_ result: UnsafeMutablePointer<Decimal>, _ leftOperand: UnsafePointer<Decimal>, _ rightOperand: UnsafePointer<Decimal>, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         两个十进制数相减, 并将leftOperand 和 rightOperand 相减的结果存储在result中
         */
        let subtractDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalSubtract(subtractDecimal, addDecimal1, addDecimal2, .down)
        print("subtractDecimal.pointee is \(subtractDecimal.pointee)")// -70.00106
        
        
        //MARK:func NSDecimalDivide(_ result: UnsafeMutablePointer<Decimal>, _ leftOperand: UnsafePointer<Decimal>, _ rightOperand: UnsafePointer<Decimal>, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         两个十进制数相除，并将leftOperand 和 rightOperand 相除的结果存储在result中
         */
        let divideDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalDivide(divideDecimal, addDecimal1, addDecimal2, .down)
        print("divideDecimal.pointee is \(divideDecimal.pointee)")
        
        //MARK:func NSDecimalMultiply(_ result: UnsafeMutablePointer<Decimal>, _ leftOperand: UnsafePointer<Decimal>, _ rightOperand: UnsafePointer<Decimal>, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         两个十进制数相乘，并将leftOperand 和 rightOperand 相乘的结果存储在result中
         */
        let multiplyDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalMultiply(multiplyDecimal, addDecimal1, addDecimal2, .down)
        print("multiplyDecimal.pointee is \(multiplyDecimal.pointee)")
        
        
        //MARK:func NSDecimalMultiplyByPowerOf10(_ result: UnsafeMutablePointer<Decimal>, _ number: UnsafePointer<Decimal>, _ power: Int16, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         将十进制数乘以指定的10的幂, 将结果存储在result中
         */
        let powerOf10Decimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalMultiplyByPowerOf10(powerOf10Decimal, addDecimal1, 2, .down)
        print("powerOf10Decimal.pointee is \(powerOf10Decimal.pointee)")
        
        
        //MARK:func NSDecimalRound(_ result: UnsafeMutablePointer<Decimal>, _ number: UnsafePointer<Decimal>, _ scale: Int, _ roundingMode: NSDecimalNumber.RoundingMode)
        /**
         舍入小数值，将舍入结果存储在result中
         */
        
        let roundDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalRound(roundDecimal, addDecimal2, 3, .down)
        print("roundDecimal.pointee is \(roundDecimal.pointee)")
        
        //MARK:func NSDecimalPower(_ result: UnsafeMutablePointer<Decimal>, _ number: UnsafePointer<Decimal>, _ power: Int, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         将十进制数提高到指定的功率，结果存储在result中
         */
        let powerDecimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        NSDecimalPower(powerDecimal, addDecimal2, 2, .down)
        print("powerDecimal.pointee is \(powerDecimal.pointee)")
        
        
        //MARK:func NSDecimalNormalize(_ number1: UnsafeMutablePointer<Decimal>, _ number2: UnsafeMutablePointer<Decimal>, _ roundingMode: NSDecimalNumber.RoundingMode) -> NSDecimalNumber.CalculationError
        /**
         规范化两个十进制数的内部格式以简化以后的操作
         */
        
        let number1Decimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        number1Decimal.pointee = 1000
        
        let number2Decimal = UnsafeMutablePointer<Decimal>.allocate(capacity: 1)
        number2Decimal.pointee = 200
        
        NSDecimalNormalize(number1Decimal, number2Decimal, .plain)
        print("number1Decimal.pointee is \(number1Decimal.pointee)")
        print("number2Decimal.pointee is \(number2Decimal.pointee)")
        
        
        //MARK:typealias RoundingMode = NSDecimalNumber.RoundingMode
        /**
         枚举的别名，用于指定可能的舍入模式
         
         extension NSDecimalNumber {
         
         
         /***************    Type definitions        ***********/
         public enum RoundingMode : UInt {
         
         
         case plain
         
         case down
         
         case up
         
         case bankers
         }
         
         Rounding policies :
         Original
         value    1.2  1.21  1.25  1.35  1.27
         Plain    1.2  1.2   1.3   1.4   1.3
         Down     1.2  1.2   1.2   1.3   1.2
         Up       1.2  1.3   1.3   1.4   1.3
         Bankers  1.2  1.2   1.2   1.4   1.3
         
         
         public enum CalculationError : UInt {
         
         
         case noError
         
         case lossOfPrecision // Result lost precision
         
         case underflow // Result became 0
         
         case overflow // Result exceeds possible representation
         
         case divideByZero
         }
         }

         */
        
        
        //MARK:----- 10. 获得十进制的特征
        //MARK:var sign: FloatingPointSign { get } //小数的符号
        
        //MARK:var exponent: Int { get } // 小数的指数
        
        //MARK:var significand: Decimal { get } // 小数的有效位数
        
        //MARK:var magnitude: Decimal { get } // 小数的大小
        
        //MARK:var floatingPointClass: FloatingPointClassification { get }
        
        //MARK:var isCanonical: Bool { get } // Boolean值， 指示次小数的表示是否是规范的
        
        //MARK:var isInfinite: Bool { get } // Boolean值， 指示此小数是否为无穷大
        
        //MARK:var isNaN: Bool { get } // Boolean值， 指示此小数是否为NaN
        
        //MARK:var isNormal: Bool { get } // Boolean值，指示此小数是否正常（非0，低于正常，无穷大或NaN）
        
        //MARK:var isSignMinus: Bool { get } // Boolean值，指示此小数是否具有符号
        
        //MARK:var isSignaling: Bool { get } // Boolean值， 指示此小数是否是信令NaN
        
        //MARK:var isSubnormal: Bool { get } // Boolean值， 指示此小数是否为次正规
        
        //MARK:var isZero: Bool { get } // Boolean值， 指示此值是否为0
        
        //MARK:var nextDown: Decimal { get } // 小于此小数的最大可表示值
        
        print(" addDecimal2.pointee.nextDown is \(addDecimal2.pointee.nextDown), \n addDecimal2.pointee is \(addDecimal2.pointee) ")
        
        
        //MARK:nextUp: Decimal { get } // 最小可表示的值大于此小数
        print(" addDecimal2.pointee.nextUp is \(addDecimal2.pointee.nextDown), \n addDecimal2.pointee is \(addDecimal2.pointee) ")
        
        //MARK:ulp: Decimal { get } // 小数的最后一位的单位
        print(" addDecimal2.pointee.ulp is \(addDecimal2.pointee.ulp)")
        
        
        //MARK:----- 11. 得到特定小数
        
        //MARK:static let greatestFiniteMagnitude: Decimal
        let finiteMagnitude = Decimal.init(1000.0001)
        print(finiteMagnitude)


        //MARK:static let greatestFiniteMagnitude: Decimal // 包含底层表示的最大可能非无限大小的小数。
        print("Decimal.greatestFiniteMagnitude is \(Decimal.greatestFiniteMagnitude)")
        
        //MARK:static let leastFiniteMagnitude: Decimal // 包含底层表示的最小可能非无限大小的小数。
        print("Decimal.leastFiniteMagnitude is \(Decimal.leastFiniteMagnitude)")
        
        //MARK:static let leastNonzeroMagnitude: Decimal // 十进制值，表示基础表示的最小可能非零值。
        print("Decimal.leastNonzeroMagnitude is \(Decimal.leastNonzeroMagnitude)")
        
        //MARK:static let leastNormalMagnitude: Decimal // 十进制值，表示底层表示的最小可能正常幅度。
        print("Decimal.leastNormalMagnitude is \(Decimal.leastNormalMagnitude)")
        
        //MARK:static let pi: Decimal // 数学常数pi。
        print("Decimal.pi is \(Decimal.pi)")
        
        //MARK:static var nan: Decimal // 表示“非数字”的值。
        print("Decimal.nan is \(Decimal.nan)")
        
        //MARK:static var quietNaN: Decimal // 安静地表示非数字。
        print("Decimal.quietNaN is \(Decimal.quietNaN)")
        
        //MARK:static var radix: Int // 十进制数使用的基数。
        print("Decimal.radix is \(Decimal.radix)")
        
        //MARK:var NSDecimalMaxSize: Int32 // 最大尺寸 Decimal
        //MARK:var NSDecimalNoScale: Int32 // 指定不应限制十进制数字中小数点分隔符后允许的位数。
        
        //MARK:----- 12. 比较小数
        
        //MARK:static func < (lhs: Decimal, rhs: Decimal) -> Bool
        /**
         返回一个Boolean值， 指示一个十进制数是否严格小于另一个十进制数
         */
        
        //MARK:static func == (lhs: Decimal, rhs: Decimal) -> Bool
        /**
         返回一个Boolean值，指示两个十进制数是否相等
         */
        
        //MARK:func isEqual(to other: Decimal) -> Bool
        /**
         返回一个Boolean值，指示当前小数是否等于指定的小数
         */
        
        //MARK:func isLess(than other: Decimal) -> Bool
        /**
         返回一个Boolean值， 指示此小数是否小于指定的小数
         */
        
        //MARK:func isLessThanOrEqualTo(_ other: Decimal) -> Bool
        /**
         返回一个Boolean值，指示当前小数是否小于或等于指定的小数
         */
        
        //MARK:func isTotallyOrdered(belowOrEqualTo other: Decimal) -> Bool
        /**
         返回一个Boolean值，指示此实例是否应以升序排序在给定值之前
         */
        
        //MARK:func distance(to other: Decimal) -> Decimal
        /**
         返回从当前值到指定值的距离
         */
        
        //MARK:func advanced(by n: Decimal) -> Decimal
        /**
         返回给定距离前进的新值
         */
        let value = Decimal.init(1000.999)
        let advancedDecimal = Decimal.init(0)
        let advancedResult = advancedDecimal.advanced(by: value)
        print("advancedResult is \(advancedResult)")
        
        //MARK:func NSDecimalCompare(_ leftOperand: UnsafePointer<Decimal>, _ rightOperand: UnsafePointer<Decimal>) -> ComparisonResult
        /**
         比较两个十进制值的大小
         public enum ComparisonResult : Int {
         
         case orderedAscending = -1 // 左操作数小于右操作数
         case orderedSame           // 两个操作数相等
         case orderedDescending     // 左操作数大于右操作数
         
         internal static func _fromCF(_ val: CFComparisonResult) -> ComparisonResult {
         if val == kCFCompareLessThan {
         return .orderedAscending
         } else if  val == kCFCompareGreaterThan {
         return .orderedDescending
         } else {
         return .orderedSame
         }
         }
         }
         */
        print("NSDecimalCompare(addDecimal1, addDecimal2) is \(NSDecimalCompare(addDecimal1, addDecimal2).rawValue)")
        
        //MARK:---- 13. 描述一个小数
        //MARK:var description: String { get } //小数的文字描述
        print("value.description is \(value.description)")
        
        //MARK:hashValue: Int // 计算的小数哈希值
        print("value.hashValue is \(value.hashValue)")
        
        
        //MARK:----- 14. 编码和解码
        //MARK:func encode(to encoder: Encoder) throws //将此十进制值编码到给定的编码器中
        //MARK:init(from decoder: Decoder) throws //通过给定解码器解码来创建新的十进制值
        
        
        //MARK:----- 15. 使用的参考类型
        
        //MARK:class NSDecimalNumber // 用于表示和执行桥接的基数为10的算术的对象Decimal
        
        //MARK:**************************** NSDecimalNumber ********************
        
        //MARK:----- 1. NSEXceptionName
        
        //MARK:public init (rawValue: String)
        /**
         public private(set) var rawValue: String
         
         public init(_ rawValue: String) {
         self.rawValue = rawValue
         }
         
         public init(rawValue: String) {
         self.rawValue = rawValue
         }
         */
        
        let exception404 = NSExceptionName.init("not found 404")
        let exception500 = NSExceptionName.init("server error 500")
        print("exception404 == exception500  is \(exception404 == exception500 )")
        
        //MARK:extension NSExceptionName
        /**
         extension NSExceptionName {
         public static let decimalNumberExactnessException = NSExceptionName(rawValue: "NSDecimalNumberExactnessException")
         //如果存在严格性错误，则会引发异常
         public static let decimalNumberOverflowException = NSExceptionName(rawValue: "NSDecimalNumberOverflowException")
         //溢出时引发异常
         public static let decimalNumberUnderflowException = NSExceptionName(rawValue: "NSDecimalNumberUnderflowException")
         //下溢引发的例外情况
         public static let decimalNumberDivideByZeroException = NSExceptionName(rawValue: "NSDecimalNumberDivideByZeroException")
         //划分为零的例外情况
         }
         */

        //MARK:----- 2. NSDecimalNumberHandler
        /**
         NSDecimalNumber 的处理程序
         */
        
        //MARK:class var default: NSDecimalNumberHandler { get } //返回默认实例
        
        print("NSDecimalNumberHandler.default is \(NSDecimalNumberHandler.default)")
        
        //MARK:init(roundingMode: NSDecimalNumber.RoundingMode, scale: Int16, raiseOnExactness exact: Bool, raiseOnOverflow overflow: Bool, raiseOnUnderflow underflow: Bool, raiseOnDivideByZero divideByZero: Bool)
        /**
         parameters:
         
         
         roundinMode: .plain , .down , .up , bankers
         public enum RoundingMode : UInt {
         case plain // Round up on a tie
         case down // Always down == truncate
         case up // Always up
         case bankers // on a tie round so last digit is even
         }

         scale:Int16 舍入值在其小数点后应具有的位数
         
         rainseOnExactness:Bool, 如果为true ， 在出现精确错误的情况下，处理程序将引发异常
         
         raiseOnOverflow:Bool，如果为true， 在溢出错误的情况下，处理程序将引发异常
         
         rainseOnUnderflow:Bool， 如果为true，在发生下溢错误的情况下，处理程序将引发异常
         
         raiseOnDivideByZero:Bool， 如果为true，在除以零错误的情况下，处理程序将引发异常

         */
        
        let decimalNumberHandler = NSDecimalNumberHandler.init(roundingMode: .plain, scale: 3, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)
        print("decimalNumberHandler.description is \(decimalNumberHandler.description)")
        
        //MARK:----- 3. NSDecimalNumber
        
        //MARK:--- 3.1 创建十进制数
        //MARK:@NSCopying class var one: NSDecimalNumber { get } //十进制数，相当于数字1.0
        print("NSDecimalNumber.one is \(NSDecimalNumber.one)")
        
        //MARK:@NSCopying class var zero: NSDecimalNumber { get } // 一个等于数字0.0的十进制数
        print("NSDecimalNumber.zero is \(NSDecimalNumber.zero)")
        
        //MARK:@NSCopying class var notANumber: NSDecimalNumber { get } // 十进制数，指定无数字
        print("NSDecimalNumber.notANumber is \(NSDecimalNumber.notANumber)")
        
        
        //MARK:--- 3.2 初始化十进制数
        //MARK:init(decimal dcm: Decimal) // 初始化十进制数用以表示给定的小数
        
        let dcm = Decimal.init(100.001)
        let dcmNumber = NSDecimalNumber.init(decimal: dcm)
        print("dcmNumber is \(dcmNumber)")
        
        //MARK:convenience init(mantissa: UInt64, exponent: Int16, isNegative flag: Bool)
        /**
         使用给定的尾数，指数和符号初始化十进制数
         */
        
        let dcmNumber1 = NSDecimalNumber.init(mantissa: 12, exponent: 2, isNegative: true)
        print("dcmNumber1 is \(dcmNumber1)")
        
        //MARK:convenience init(string numberValue: String?)
        /**
         初始化十进制数， 使其值等于给定数字字符串中的值
         */
        
        let stringDcmNumber = NSDecimalNumber.init(string: "123s")
        print("stringDcmNumber is \(String(describing: stringDcmNumber))")
        
        //MARK:convenience init(string numberValue: String?, locale: Any?)
        /**
         初始化十进制数，使其值等于给定数字字符串中的值，使用给定的语言环境进行解释。
         */
        
        let localeDcmNumber = NSDecimalNumber.init(string: "234ooo", locale: NSLocale.autoupdatingCurrent)
        print("localeDcmNumber is \(localeDcmNumber)")
        
        
        //MARK:--- 3.3 执行算术
        //MARK:func adding(_ decimalNumber: NSDecimalNumber) -> NSDecimalNumber // 将当前的数字和另一个给定的数字相加
        
        let currentDecimalNumber = NSDecimalNumber.init(value: 10.2)
        let otherDecimalNumber = NSDecimalNumber.init(value: 13.9)
        var resultDecimalNumber = currentDecimalNumber.adding(otherDecimalNumber)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func subtracting(_ decimalNumber: NSDecimalNumber) -> NSDecimalNumber
        
        resultDecimalNumber = currentDecimalNumber.subtracting(otherDecimalNumber)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func multiplying(by decimalNumber: NSDecimalNumber) -> NSDecimalNumber
        /**
         将该数字乘以另一个给定的数字
         */
        
        resultDecimalNumber = currentDecimalNumber.multiplying(by: otherDecimalNumber)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func dividing(by: decimalNumber : NSDecimalNumber) -> NSDecimalNumber
        /**
         将当前数字除以另一个给定数字
         */
        resultDecimalNumber = currentDecimalNumber.dividing(by: otherDecimalNumber)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func raising(toPower power: Int) -> NSDecimalNumber
        /**
         将当前的数字提高到给定的倍数
         */
        
        resultDecimalNumber = currentDecimalNumber.raising(toPower: 2)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func adding(byPowerOf10 power: Int16) -> NSDecimalNumber
        /**
         将数字乘以10到给定的倍数
         */
        
        resultDecimalNumber = currentDecimalNumber.multiplying(byPowerOf10: 2)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func adding(_ decimalNumber: NSDecimalNumber, withBehavior behavior: NSDecimalNumberBehaviors?) -> NSDecimalNumber
        /**
         使用指定的行为将此数字添加到另一个给定的数字
         */
        let decimalNumberBehavior = NSDecimalNumber.defaultBehavior
        resultDecimalNumber = currentDecimalNumber.adding(otherDecimalNumber, withBehavior: decimalNumberBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:func subtracting(_ decimalNumber: NSDecimalNumber, withBeahavior behavior: NSDecimalNumberBehaviors?) -> NSDecimalNumber
        
        /**
         使用指定的行为从当前数字减去给定数字
         */
        resultDecimalNumber = currentDecimalNumber.subtracting(otherDecimalNumber, withBehavior: NSDecimalNumber.defaultBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK: func multiplying(by decimalNumber: NSDecimalNumber, withBehavior behavior: NSDeicmalNumberBehaviors?) -> NSDecimalNumber
        /**
         使用指定的行为将此数字乘以另一个给定的数字
         */
        
        resultDecimalNumber = currentDecimalNumber.multiplying(by: otherDecimalNumber, withBehavior: NSDecimalNumber.defaultBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK: func dividing(by decimalNumber: NSDecimalNumber, withBehavior behavior: NSDeicmalNumberBehaviors?) -> NSDecimalNumber
        /**
         使用指定的行为将此数字除以另一个给定的数字
         */
        
        resultDecimalNumber = currentDecimalNumber.dividing(by: otherDecimalNumber, withBehavior: NSDecimalNumber.defaultBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        
        //MARK:func raising(toPower power: Int, withBehavior behavior: NSDecimalNumberBehaviors?) -> NSDecimalNumber
        /**
         使用指定的行为将数字增加到给定的功率
         */
        resultDecimalNumber = currentDecimalNumber.raising(toPower: 30, withBehavior: NSDecimalNumber.defaultBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        
        //MARK:func multiplying(byPowerOf10 power: Int16, withBehavior behavior: NSDecimalNumberBehaviors?) -> NSDecimalNumber
        /**
         使用指定的行为将数字乘以10提升到给定的功率
         */
        
        resultDecimalNumber = currentDecimalNumber.multiplying(byPowerOf10: 3, withBehavior: NSDecimalNumber.defaultBehavior)
        print("resultDecimalNumber is \(resultDecimalNumber)")
        
        //MARK:--- 3.4 四舍五入
        
        //MARK:func rounding(accordingToBehavior behavior: NSDecimalNumberBehaviors?) -> NSDecimalNumber
        let roundingDecimalNumber = currentDecimalNumber.rounding(accordingToBehavior: NSDecimalNumber.defaultBehavior)
        print("roundingDecimalNumber is \(roundingDecimalNumber)")
        
        
        //MARK:--- 3.5 管理行为
        //MARK:class var defaultBehavior: NSDecimalNumberBehaviors { get set }
        /**
         默认的算术方法四舍五入和处理错误条件的方式
         */
        print("NSDecimalNumber.defaultBehavior is \(NSDecimalNumber.defaultBehavior)")
        
        //MARK:protocol NSDecimalNumberBehaviors
        /**
         一种协议，声明控制使用十进制数的自由裁量方面的三种方法
         */
        
        //MARK:class NSDecimalNumberHandler
        /**
         采用十进制数行为协议的类
         */
        
        
        //MARK:--- 3.6 获取value
        
        //MARK: var decimalValue: Decimal { get }// 十进制数的值，表示为Decimal结构
        print("currentDecimalNumber.decimalValue is \(currentDecimalNumber.decimalValue)")
        
        //MARK:var doubleValue: Double { get } // 十进制数的最接近的近似值 double
        print("currentDecimalNumber.doubleValue is \(currentDecimalNumber.doubleValue)")
        
        //MARK:func decription(withLocale locale: Any?) -> String //返回适合指定语言环境的十进制数字符串表示形式
        print("currentDecimalNumber.description(withLocale: NSLocale.autoupdatingCurrent) is \(currentDecimalNumber.description(withLocale: NSLocale.autoupdatingCurrent))")
        
        //MARK:var objCType: UnsafePointer<Int8> // 包含十进制数对象中包含的数据的Objective-C类型的AC字符串
        print("currentDecimalNumber.objCType is \(currentDecimalNumber.objCType)")
        
        
        //MARK:--- 3.7 比较十进制数
        
        //MARK:func compare(_ decimalNumber: NSNumber) -> ComparisonResult
        /**
         比较这个十进制数和另一个
         */
        
        print("currentDecimalNumber.compare(otherDecimalNumber) is \(currentDecimalNumber.compare(otherDecimalNumber))")
        
        
        //MARK:--- 3.8 获取最大和最小可能值
        //MARK:class var maximum: NSDecimalNumber { get }
        /**
         返回十进制数的最大可能值
         */
        
        print("NSDecimalNumber.maximum is \(NSDecimalNumber.maximum)")
        
        //MARK:class var minimum: NSDecimalNumber { get }
        /**
         返回十进制数的最小可能值
         */
        print("NSDecimalNumber.minimum is \(NSDecimalNumber.minimum)")
        
        
        //MARK:**************************** NSGeometry **************************
        
        //MARK:----- 1. CGPoint
//        extension CGPoint {
//            public static var zero: CGPoint {
//                return CGPoint(x: CGFloat(0), y: CGFloat(0))
//            }
//
//            public init(x: Int, y: Int) {
//                self.init(x: CGFloat(x), y: CGFloat(y))
//            }
//
//            public init(x: Double, y: Double) {
//                self.init(x: CGFloat(x), y: CGFloat(y))
//            }
//        }
        
        //MARK:----- 2. CGSize
//        public struct CGSize {
//            public var width: CGFloat
//            public var height: CGFloat
//            public init() {
//                self.init(width: CGFloat(), height: CGFloat())
//            }
//            public init(width: CGFloat, height: CGFloat) {
//                self.width = width
//                self.height = height
//            }
//        }
        
        //MARK:----- 3. CGRect
//        extension CGRect {
//            public static var zero: CGRect {
//                return CGRect(origin: CGPoint(), size: CGSize())
//            }
//
//            public init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
//                self.init(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
//            }
//
//            public init(x: Double, y: Double, width: Double, height: Double) {
//                self.init(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
//            }
//
//            public init(x: Int, y: Int, width: Int, height: Int) {
//                self.init(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
//            }
//        }
        
        let view = UIView(frame: CGRect(x: 50, y: 100, width: 80, height: 30))
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
        
        let cgpoint = CGPoint(x: 60, y: view.frame.maxY + 30)
        let cgsize = CGSize(width: 60, height: 20)
        let label = UILabel(frame: CGRect(origin: cgpoint, size: cgsize))
        label.text = "CGPoint"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = UIColor.gray
        self.view.addSubview(label)
        
        //MARK:----- 4. NSEdgeInsets
//        public struct NSEdgeInsets {
//            public var top: CGFloat
//            public var left: CGFloat
//            public var bottom: CGFloat
//            public var right: CGFloat
//
//            public init() {
//                self.init(top: CGFloat(), left: CGFloat(), bottom: CGFloat(), right: CGFloat())
//            }
//
//            public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
//                self.top = top
//                self.left = left
//                self.bottom = bottom
//                self.right = right
//            }
//        }
        
        //MARK:--- 4.1 水平布局
        
        /**
         首先我们要知道button默认布局是image在左，title在右，两者之间无间隙
         */
        let btnW : CGFloat = 100
        let btnH : CGFloat = 40
        let imgW : CGFloat = 20
        let titleW : CGFloat = 50
        let marginW : CGFloat = 6
        
        let button = UIButton(frame: CGRect(x: 50, y: label.frame.maxY + 30, width: btnW, height: btnH))
        button.backgroundColor = UIColor.gray
        button.setTitle("button", for: .normal)
        button.setImage(UIImage.init(named: "icon_push"), for: .normal)
        button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button.tag = 0
        self.view.addSubview(button)
        
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center

        button.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + marginW, 0, -titleW - marginW)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -(imgW + marginW), 0, (imgW + marginW))
        
        /**
         if (btnW < imgW){图像会被压缩，文字不显示}
         
         if (btnW < imgW + titleW){图像正常显示，文字显示不全}
         
         if (btnW >=  imgW + titleW){图像和文字都居中显示，imageView在左，label在右，中间没有空隙}
         */
        
        //FIXME:marginW是文字跟图片间的间隔，imgW是图片的实际宽度，也就是UI切图出来的图片宽度，并不是你想要图片的宽度, btnW应该大于imgW + titleW + marginW 之和，否则会造成文字无法显示完全
        
        //MARK:--- 4.2 垂直布局
        
        let btnW1 : CGFloat = 80
        let btnH1 : CGFloat = 80
        let imgH : CGFloat = 30
        let titleH : CGFloat = 20
        let marginH : CGFloat = 10
        
        let button1 = UIButton(frame: CGRect(x: 50, y: button.frame.maxY + 30, width: btnW1, height: btnH1))
        button1.backgroundColor = UIColor.gray
        button1.setTitle("button", for: .normal)
        button1.setImage(UIImage.init(named: "icon_push"), for: .normal)
        self.view.addSubview(button1)
        
        button1.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        button1.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button1.tag = 1
        
        button1.imageEdgeInsets = UIEdgeInsetsMake(marginH, (btnW1 - imgH)/2, btnH1 - imgH - marginH, 0);
        //刚开始据下Y=(btnH - titleH)/2 = 90,现在调整为据下20，为70*2 = 140
        button1.titleEdgeInsets = UIEdgeInsetsMake(marginH + imgH + marginH, -marginH*2, marginH, 0);

        
        
        //MARK:----- 5. extension NSValue
//        extension NSValue {
//            public convenience init(point: NSPoint) {
//                self.init()
//                self._concreteValue = NSSpecialValue(point)
//            }
//
//            public convenience init(size: NSSize) {
//                self.init()
//                self._concreteValue = NSSpecialValue(size)
//            }
//
//            public convenience init(rect: NSRect) {
//                self.init()
//                self._concreteValue = NSSpecialValue(rect)
//            }
//
//            public convenience init(edgeInsets insets: NSEdgeInsets) {
//                self.init()
//                self._concreteValue = NSSpecialValue(insets)
//            }
//
//            public var pointValue: NSPoint {
//                let specialValue = self._concreteValue as! NSSpecialValue
//                return specialValue._value as! NSPoint
//            }
//
//            public var sizeValue: NSSize {
//                let specialValue = self._concreteValue as! NSSpecialValue
//                return specialValue._value as! NSSize
//            }
//
//            public var rectValue: NSRect {
//                let specialValue = self._concreteValue as! NSSpecialValue
//                return specialValue._value as! NSRect
//            }
//
//            public var edgeInsetsValue: NSEdgeInsets {
//                let specialValue = self._concreteValue as! NSSpecialValue
//                return specialValue._value as! NSEdgeInsets
//            }
//        }
        
        //MARK:**************************** CGFloat *****************************
        
        
        //MARK:**************************** AffineTransform *********************
        
        //MARK:**************************** NSNumber ****************************
        
        //MARK:**************************** NSCFBoolean *************************
        
        //MARK:**************************** NSConcreteValue *********************
        
        //MARK:**************************** NSSpecialValue **********************
        
        //MARK:**************************** NSValue *****************************
        
        //MARK:**************************** NSMeasurement ***********************
        
        //MARK:**************************** Unit ********************************
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func click(_ sender : UIButton) {
        if sender.tag == 0 {
            print("水平布局")
        } else {
            print("垂直布局")
        }
    }


}

