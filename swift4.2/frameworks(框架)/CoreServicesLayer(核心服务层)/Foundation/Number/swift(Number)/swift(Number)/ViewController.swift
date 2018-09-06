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
        
        
        //MARK:**************************** NSGeometry **************************
        
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


}

