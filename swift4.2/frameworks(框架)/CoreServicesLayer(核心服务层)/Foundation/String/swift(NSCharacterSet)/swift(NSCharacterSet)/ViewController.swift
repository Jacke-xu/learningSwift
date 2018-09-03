//
//  ViewController.swift
//  swift(NSCharacterSet)
//
//  Created by 范云飞 on 2018/9/1.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         NSCharacterSet 和 NSMutableCharacterSet, 用面向对象的方式来表示一组Unicode字符。它经常与String和Scanner组合起来用，在不同的字符上做过滤、删除、分割操作。NSCharacterSet 是无序字符集合
         */
        
        //MARK:---------------- 获得标准字符集 ------------------
        /**
         1. static var alphanumerics: CharacterSet { get }           // 返回数字字母字符集
         2. static var capitalizedLetters: CharacterSet { get }      // 返回首字母大写的字符集
         3. static var controlCharacters: CharacterSet { get }       // 返回控制字符的字符集
         4. static var decimalDigits: CharacterSet { get }           // 返回十进制数字的字符集
         5. static var decomposables: CharacterSet { get }           // 返回可分解的字符集
         6. static var illegalCharacters: CharacterSet { get }       // 返回非法字符集
         7. static var letters: CharacterSet { get }                 // 返回字母集
         8. static var lowercaseLetters: CharacterSet { get }        // 返回小写字母集
         9. static var newlines: CharacterSet { get }                // 返回换行符集
         10. static var nonBaseCharacters: CharacterSet { get }      // 返回返回非基本字符集
         11. static var punctuationCharacters: CharacterSet { get }  // 返回标点字符集
         12. static var symbols: CharacterSet { get }                // 返回符号集
         13. static var uppercaseLetters: CharacterSet { get }       // 返回大写字母集
         14. static var whitespaces: CharacterSet { get }            // 返回空格字符集
         15. static var whitespacesAndNewlines: CharacterSet { get } // 返回空格和换行字符集
         */

        
        //MARK:---------------- 获取URL编码的字符集 --------------------
        /**
         1. static var urlFragmentAllowed: CharacterSet { get }   // 返回url组件中允许的字符的字符集
         2. static var urlHostAllowed: CharacterSet { get }       // 返回主机url子组件中允许的字符的字符集
         3. static var urlPasswordAllowed: CharacterSet { get }   // 返回密码url子组件中允许的字符的字符集
         4. static var urlPathAllowed: CharacterSet { get }       // 返回路径url组件中允许的字符的字符集
         5. static var urlQueryAllowed: CharacterSet { get }      // 返回查询url组件中允许的字符的字符集
         6. static var urlUserAllowd: CharacterSet { get }        // 返回用户url子组件中允许的字符的字符集
         
         */
        
        //MARK:---------------- 创建自定义字符集 --------------------
        /**
         1. init() // 初始化一个空实例
         */
        let characterSet = CharacterSet.init()
        
        
        /**
         2. convenience init<S>(_ sequence: S) where S : Sequence, Unicode.Scalar == S.Element // 从有限的的项目序列创建新集合
         */
        let validIndices = Set(0..<7).subtracting([2, 4, 5])
        print("validIndices is \(validIndices)")
        
        /**
         3. init(charactersIn string: String) // 使用给定字符串中的字符进行初始化
         */
        var givenCharacterSet = CharacterSet.init(charactersIn: "123")
        print("givenCharacterSet is \(givenCharacterSet)")
        
        
        //MARK:---------------- 创建和管理位图表示 ------------------
        /**
         1. init(bitmapRepresentation data: Data) // 使用位图表示进行初始化
         */
        
        /**
         2. init?(contentsOfFile file: String) // 使用文件的内容进行初始化
         */
        
        /**
         3. @nonobjc var bitmapRepresentation: Data // 返回二进制格式的表示形式
         */
        
        //MARK:---------------- 反转字符集 ----------------------
        /**
         1. mutating func invert() // 反转的内容
         */
        givenCharacterSet.invert()
        print("givenCharacterSet is \(givenCharacterSet)")
        
        /**
         2. @nonobjc var inverted: CharacterSet { get } // 返回接收器的反向副本
         */
        let invertSet: CharacterSet =  givenCharacterSet.inverted
        print("invertSet is \(invertSet)")
        
        
        //MARK:---------------- 组合字符集 ---------------------
        /**
         1. mutating func formIntersection(_ other: CharacterSet) // 将值设置为和另一个CharacterSet的交集
         */
        
        givenCharacterSet.formIntersection(CharacterSet.init(charactersIn: "421"))
        print("givenCharacterSet is \(givenCharacterSet)")
        
        /**
         2. mutating func formSymmetricDifference(_ other: CharacterSet) //将值设置为和另一个CharacterSet的并集在减去它们之间的交集
         */
        
        
        /**
         3. mutating func formUnion(_ other: CharacterSet) // 将值设置为和另一个CharacterSet类型的并集
         */
        
        /**
         4. func hasMember(inPlane plane: UInt8) -> Bool // 判断当前CharacterSet 中是否包含UInt8 类型的字符
         */
        
        /**
         5. mutating func insert(charactersIn string: String) // 插入指定字符串
         */
        
        /**
         6. func intersection(_ other: CharacterSet) -> CharacterSet // 返回和另一个CharacterSet 的交集
         */
        
        /**
         7. mutating func invert() // 翻转内容
         */
        
        /**
         8. func isDisjoint(with other: CharacterSet) -> Bool // 返回一个Boolean 值， 判断当前集合是否和给定的集合有交集
         */
        
        /**
         9. func isStrictSubset(of other: CharacterSet) -> Bool // 返回一个Boolean值， 判断当前集合是否是给定集合的严格子集
         */
        
        /**
         10. func isStrictSuperset(of other: CharacterSet) -> Bool //返回一个Boolean 值， 判断当前集合是否是给定集合的严格超集
         */
        
        /**
         11. func isSubset(of other: CharacterSet) -> Bool // 返回一个Boolea值， 判断当前集合是否是另个集合的子集
         */
        
        /**
         12. func isSuperset(of other: CharacterSet) -> Bool // 返回一个Boolean值， 判断当前集合是否是另个集合超集
         */
        
        /**
         13. mutating func remove(charactersIn string: String) // 删除指定的字符串中的值
         */
        
        /**
         14. func subtracting(_ other: CharacterSet) -> CharacterSet // 通过删除另一个CharacterSet中的元素，创建一个新的CharacterSet类型
         */
        
        /**
         15. func symmetricDifference(_ other: CharacterSet) -> CharacterSet // 返回和另一个CharacterSet的并集在减去它们之间的交集，
         */
        
        /**
         16. func union(_ other: CharacterSet) -> CharacterSet // 通过返回和另一个CharacterSet的并集，创建一个新的CharacterSet
         */
        
        
        //MARK:---------------- 添加字符 -----------------------
        
        /**
         1. mutating func insert(charactersIn string: String) // 插入指定的字符串
         */
        
        //MARK:---------------- 删除字符 ----------------------
        
        /**
         1. mutating func remove(charactersIn string: String) // 删除指定字符串中的值
         */
        
        /**
         2. func subtracting(_ other: CharacterSet) -> CharacterSet // 通过删除另一个CharacterSet中的元素，创建一个新的CharacterSet类型
         */
        
        //MARK:---------------- 测试集成员资格 -----------------
        
        /**
         1. func hasMember(inPlane plane: UInt8) -> Bool // 判断当前CharacterSet 中是否包含UInt8 类型的字符
         */
        
        /**
         2. func isDisjoint(with other: CharacterSet) -> Bool // 返回一个Boolean 值， 判断当前集合是否和给定的集合有交集
         */
        
        /**
         3. func isStrictSubset(of other: CharacterSet) -> Bool // 返回一个Boolean值， 判断当前集合是否是给定集合的严格子集
         */
        
        /**
         4. func isStrictSuperset(of other: CharacterSet) -> Bool //返回一个Boolean 值， 判断当前集合是否是给定集合的严格超集
         */
        
        /**
         5. func isSubset(of other: CharacterSet) -> Bool // 返回一个Boolea值， 判断当前集合是否是另个集合的子集
         */
        
        /**
         6. func isSuperset(of other: CharacterSet) -> Bool // 返回一个Boolean值， 判断当前集合是否是另个集合超集
         */
        
        /**
         7. var isEmpty: Bool { get } // 返回一个Boolean值， 判断集合中是否我空元素
         */
        
        //MARK:---------------- 比较字符集 -------------------
        
        /**
         1. static func != (lhs: CharacterSet, rhs: CharacterSet) -> Bool // 返回一个Boolean值，判断两个CharacterSet的值是否相等
         */
        
        /**
         2. static func == (lhs: CharacterSet, rhs: CharacterSet) -> Bool //返回一个Boolean值， 判断里那个CharacterSet的值是否相等
         */
        
        //MARK:---------------- 描述一个字符集 ------------------
        
        /**
         1. var description: String { get } //字符集的文字描述
         */
        
        /**
         2. var debugDescription: String { get } //适合调试的字符集的文本描述
         */
        
        /**
         3. var hashValue: Int { get } //计算的日期间隔的哈希值
         */
        
        //MARK:---------------- 使用参考类型 -------------------
        /**
         1. class NSCharacterSet //桥接到固定Unicode字符值集的对象
         */
        
        /**
         2. class NSMutableCharacterSet //桥接到可变Unicode字符值集的对象
         */
        
        /**
         3. typealias CharacterSet.ReferenceType = NSCharacterSet // 此值类型的等效引用类型别名
         */
        
        //MARK:---------------- 初始化器 ---------------------
        /**
         1. convenience init(arrayLiteral: Unicode.Scalar...) // 创建一个包含给定数组文字元素的集合
         */
        let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
        if ingredients.isSuperset(of: ["sugar", "salt"]) {
            print("Whatever it is , it's bound to be delicious!")
        }
        
        /**
         2. init(charactersIn range: Range<Unicode.Scalar>)
         */
        
        /**
         3. init(charactersIn range: ClosedRange<Unicode.Scalar>)
         */
        
        /**
         4. init(from decoder: Decoder) throws
         */
        
        
        //MARK:---------------- 实例方法 ---------------------
        
        /**
         1. func contains(_ member: Unicode.Scalar) -> Bool
         */
        
        /**
         2. func encode(to encoder: Encoder) throws
         */
        
        /**
         3. @discardableResult
            mutating func insert(_ character: Unicode.Scalar) -> (inserted: Bool, memberAfterInsert: Unicode.Scalar)
         */
        
        /**
         4. mutating func insert(charactersIn range: ClosedRange<Unicode.Scalar>)
         */
        
        /**
         5. mutating func insert(charactersIn range: Range<Unicode.Scalar>)
         */
        
        /**
         6. @discardableResult
            mutating func remove(_ character: Unicode.Scalar) -> Unicode.Scalar?
         */
        
        /**
         7. mutating func remove(charactersIn range: ClosedRange<Unicode.Scalar>)
         */
        
        /**
         8. mutating func remove(charactersIn range: Range<Unicode.Scalar>)
         */
        
        /**
         9. mutating func subtract(_ other: CharacterSet)
         */
        
        /**
         10. mutating func subtract(_ other: CharacterSet)
         */
        
        /**
         11. @discardableResult
             mutating func update(with character: Unicode.Scalar) -> Unicode.Scalar?
         */
        
        
        //MARK:---------------- 相关协议 ---------------------
        
        /**
         CustomDebugStringConvertible : https://developer.apple.com/documentation/swift/customdebugstringconvertible
         Hashable:https://developer.apple.com/documentation/swift/hashable
         CustomStringConvertible:https://developer.apple.com/documentation/swift/customstringconvertible
         ReferenceConvertible:https://developer.apple.com/documentation/foundation/referenceconvertible
         Equatable:https://developer.apple.com/documentation/swift/equatable
         SetAlgebra:https://developer.apple.com/documentation/swift/setalgebra
         */
        
        //MARK:---------------- 使用示例 ----------------------
        
        //MARK:----- 分割
        let testString = " This is the test string for %a* b* c&"
        let divArr = testString.components(separatedBy: CharacterSet.init(charactersIn: "abc"))
        print("divArr is \(divArr)")// [" This is the test string for %", "* ", "* ", "&"]
        
        
        //MARK:----- 去掉收尾空格
        let testString1 = "     This is the string contains whitespace in beginning and ending   "
        let whitesspaceStr = testString1.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        print("whitesspaceStr is \(whitesspaceStr)")//This is the string contains whitespace in beginning and ending
        
        //MARK:----- 去除首尾指定字符串
        let testString2 = "哈哈呵呵嘿嘿吼吼"
        let characterSet1 = CharacterSet.init(charactersIn: "哈吼")
        let strResult = testString2.trimmingCharacters(in: characterSet1)
        print("strResult is \(strResult)")//呵呵嘿嘿
        
        
        //MARK:----- 用指定字符串替换当前字符中的指定字符集中的字符串
        let letter = NSMutableCharacterSet.lowercaseLetter()
        let decimalDigit = CharacterSet.decimalDigits
        letter.formUnion(with: decimalDigit)
        let string = "g8!hgr3@09#23uiq%^78sjn453t78&13gesg*wt53(545y45)q3at"
        print(string.components(separatedBy: letter as CharacterSet).joined(separator: "_"))//__!____@__#_____%^___________&______*____(______)____
    
        letter.invert()
        print(string.components(separatedBy: letter as CharacterSet).joined(separator: "_"))//g8_hgr3_09_23uiq__78sjn453t78_13gesg_wt53_545y45_q3at
        
        
        //MARK:----- 去除所有空格
        let testString3 = "   a  b cd    ef gh   ij   klm   nopq retu v w   x   yz"
        print(testString3.components(separatedBy: CharacterSet.whitespaces).joined())//abcdefghijklmnopqretuvwxyz
        
        
        //MARK:----- 与NSPredicate结合使用压缩kongge
        var testString4 = "   Additional     setup  after     loading the              view."
        testString4 = testString4.trimmingCharacters(in: CharacterSet.whitespaces)
        
        var components: Array = testString4.components(separatedBy: CharacterSet.whitespaces)
        print(components)//["Additional", "", "", "", "", "setup", "", "after", "", "", "", "", "loading", "the", "", "", "", "", "", "", "", "", "", "", "", "", "", "view."]
        if let aFormat = (components as NSArray).filtered(using: NSPredicate(format: "self <> ''")) as? [String] {
            components = aFormat
        }
        
        testString4 = components.joined(separator: " ")
        print(testString4)//Additional setup after loading the view.
        
        
        //MARK:判断字符串是否只包含数字
        let number = "去你大爷的2012"
        print(validateNumber(number))//false
        let numbers = "2012"
        print(validateNumber(numbers))//true
        
        
        //MARK:限制UITextField 只能输入数字和小数点
        
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        textField.delegate = self
        textField.placeholder = "输入"
        textField.backgroundColor = UIColor.red
        self.view.addSubview(textField)
    }
    
    //MARK:判断字符串中是否只包含数字
    
    func validateNumber(_ number: String) -> Bool {
        var res = true
        let tmpSet = CharacterSet.init(charactersIn: "0123456789")
        var i: Int = 0
        while i < number.count {
            let string = (number as NSString).substring(with: NSRange(location: i, length: 1))
            print(string)
            let range: NSRange = (string as NSString).rangeOfCharacter(from: tmpSet)
            print(range)
            if range.length == 0 {
                res = false
                print(res)
            }
            i += 1
        }
        return res
    }
    
    //MARK:UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var cs : CharacterSet?
        let dotLoc = (textField.text! as NSString).range(of: ".").location
        print(NSNotFound, dotLoc)
        if NSNotFound == dotLoc && 0 != range.location {
            cs = CharacterSet.init(charactersIn: "0123456789.").inverted
        } else {
            cs = CharacterSet.init(charactersIn: "0123456789").inverted
        }
        
        var filterd: String = ""
        if let aCs: CharacterSet = cs {
            filterd = string.components(separatedBy: aCs).joined(separator: "")
            print(string, filterd)
        }
        
        let basicTest: Bool = (string == filterd)
        if !basicTest {
            print("只能输入数字和一个小数")
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

