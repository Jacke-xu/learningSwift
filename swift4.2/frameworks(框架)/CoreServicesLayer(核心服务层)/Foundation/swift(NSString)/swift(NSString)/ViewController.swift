//
//  ViewController.swift
//  swift(NSString)
//
//  Created by 范云飞 on 2018/8/2.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var string: String = String.init("nidayeda")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:----------------------- string ------------------------
        
        //MARK:public init()
        /**
         \~chinese:
         创建一个空字符串
         
         \~english:
         creates an empty string
         */
        
        let empty = ""
        let alsoEmpty = String()
        print("empty is \(empty)")
        print("alsoEmpty is \(alsoEmpty)")
        
        
        
        //MARK:public init(cString: UnsafePointer<CChar>)
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据 来创建一个新的string
         
         \~english:
         creates a new string by copying the null-terminated UTF-8 data referenced by the given pointer
         */
        
        let validUTF8: [CChar] = [67, 97, 102, -61, -87, 0]
        validUTF8.withUnsafeBufferPointer { ptr in let s = String(cString: ptr.baseAddress!); print(s) }
        
        
        //MARK:public init(cString: UnsafePointer<UInt8>)
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据 来创建一个新的string
         
         \~english:
         creates a new string by copying the null-terminated UTF-8 data referenced by the given pointer.
         */
        
        let validUInt8: [UInt8] = [23, 45, 86, 78, 0]
        validUInt8.withUnsafeBufferPointer { ptr in let s = String(cString: ptr.baseAddress!); print(s) }
        
        
        //MARK:public init?(validatingUTF8 cString: UnsafePointer<CChar>)
        /**
         \~chinese:
         通过复制和验证由给定指针引用的以null 为结尾的UTF-8数据来创建一个新的string
         
         \~english:
         creates a new string by copying and validating the null-terminated UTF-8 data referenced by the given pointer.
         */
        validUTF8.withUnsafeBufferPointer { ptr in
            let s = String(validatingUTF8:ptr.baseAddress!)
            print(s!)
        }
        
        let invalideUTF8: [CChar] = [67, 97, 102, -61, 0]
        invalideUTF8.withUnsafeBufferPointer { ptr in
            let s = String(validatingUTF8: ptr.baseAddress!)
            print(s)
        }
        
        
        //MARK: public static func decodeCString<Encoding>(_ cString: UnsafePointer<Encoding.CodeUnit>?, as encoding: Encoding.Type, repairingInvalidCodeUnits isRepairing: Bool = default) -> (result: String, repairsMade: Bool)? where Encoding : _UnicodeEncoding
        
        /**
         \~chinese:
         通过复制由给定指针引用的以null结尾的UTF-8数据按照特定的编码创建一个新的string
         
         \~english:
         creates a new string by copying  the null-terminated data referenced by the given pointer using the specified encoding.
         */
        
        let validUTF81: [UInt8] = [67, 97, 102, 195, 169, 0]
        validUTF81.withUnsafeBufferPointer { ptr in
            let s = String.decodeCString(ptr.baseAddress, as: UTF8.self, repairingInvalidCodeUnits: true)
            print(s)
        }
        
        let validUTF82: [UInt8] = [67, 97, 102, 195, 0]
        validUTF82.withUnsafeBufferPointer { ptr in
            let s = String.decodeCString(ptr.baseAddress, as: UTF8.self, repairingInvalidCodeUnits: true)
            print(s!)
        }
        
        
        //MARK:public init(_ c: Character)
        /**
         \~chinese:
         创建一个包含给定字符的string
         
         \~english:
         creates a string containing the given character.
         */
        
        let characters: [Character] = ["H", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
        let stringFromCharacter = String.init(characters)
        print("stringFromCharcter is \(stringFromCharacter)")
        
        //MARK:public init(from decoder: Decoder) throws
        /**
         \~chinese:
         创建一个新的实例,从给定的解码器解码
         
         \~english:
         creates a new instance by decoding from the given decoder.
         */
        
        //MARK:func encode(to encoder: Encoder) throws
        /**
         \~chinese:
         编码该值为给定的编码器
         
         \~english:
         Encodes this value into the given encoder.
         */
        
        
        //FIXME:withCString 还有疑问
        //MARK:public func withCString<Result>(_ body: (UnsafePointer<Int8>) throws -> Result) rethrows -> Result
        /**
         \~chinese:
         使用指向一个string内容的指针调用给定的闭包，表示为以null结尾的UTF-8代码单元序列
         
         \~english:
         calls the given closure with a pointer to the contents of the string, represented as a null-terminated sequence of UTF-8 code units
         */
        
        //MARK:public init<Subject>(describing instance: Subject)
        /**
         \~chinese:
         创建一个string 代表一个给定的的值
         
         \~english:
         creates a string representing the given value.
         */
        struct Point {
            let x: Int, y: Int
        }
        let p = Point(x: 21, y: 30)
        print("String(describing: p) is \(String(describing: p))")
        
        
        //MARK: public init<Subject>(reflecting subject: Subject)
        /**
         \~chinese:
         创建一个string，用来详细的代表给定值，便于调试
         
         \~english:
         creates a string with a detailed representation of the given value, suitable for debugging
         */
        print("String(reflecting: p) is \(String(reflecting: p))")
        
        //MARK:public init<C, Encoding>(decoding codeUnits: C, as sourceEncoding: Encoding.Type) where C : Collection, Encoding : _UnicodeEncoding, C.Element == Encoding.CodeUnit
        /**
         \~chinese:
         从给定的unicode代码单元中按照指定的编码方式创建一个字符串
         
         \~english:
         creates a string from the given Unicode code units in the specified encoding.
         */
    
        
        //MARK: public init<Encoding>(decodingCString nullTerminatedCodeUnits: UnsafePointer<Encoding.CodeUnit>, as sourceEncoding: Encoding.Type) where Encoding : _UnicodeEncoding
        
        /**
         \~chinese:
         通过被给定指针引用的以null结尾的bytes序列创建一个string
         
         \~english:
         creates a string from the null-terminated sequence of bytes at the given pointer.
         */
        
        
        //MARK:public func withCString<Result, TargetEncoding>(encodedAs targetEncoding: TargetEncoding.Type, _ body: (UnsafePointer<TargetEncoding.CodeUnit>) throws -> Result) rethrows -> Result where TargetEncoding : _UnicodeEncoding
        /**
         \~chinese:
         调用给定闭包和一个指针指向的内容字符串,表示为一个以null结尾的代码单元序列。
         
         \~english:
         calls the given closure with a pointer to the contents of the string, represented as a null-terminated sequence of code units.
         */
        
        
        //MARK:public mutating func append(_ other: String)
        /**
         \~chinese:
         把给定的string 添加到另一个string
         
         \~english:
         appends the given string to this string.
         */
        
        var greeting = "Hello, "
        greeting.append("friend")
        print("greeting is \(greeting)")
        
        
        //MARK: public func lowercased() -> String
        /**
         \~chinese:
         返回一个string 的小写形式
         
         \~english:
         returns a lowercase version of the string.
         */
        
        let cafe = "BBEE,CAD"
        print("cafe.lowercased() is \(cafe)")
        
        
        //MARK:public func uppercased() -> String
        /**
         \~chinese:
         返回一个string的大写形式
         
         \~english:
         returns an uppercase version of the string.
         */
        
        let anotherCafe = "ajlfa"
        print("anotherCafe.uppercased() is \(anotherCafe.uppercased())")
        
        
        //MARK: public mutating func withMutableCharacters<R>(_ body: (inout String.CharacterView) -> R) -> R
        /**
         \~chinese:
         将给定的闭包应用于字符串字符的可变视图
         
         \~english:
         Applies the given closure to a mutable view of the string's characters.
         */
        
        
        //MARK: public init(stringInterpolation string: String...)
        /**
         \~chinese:
         通过连接给定的插值来创建一个新的string
         
         \~english:
         Creates a new string by concatenating the given interpolations.
         */
        
        
        //MARK:public init(repeating repeatedValue: String, count: Int)
        /**
         \~chinese:
        通过重复特定次数的给定string来创建一个新的string
         
         \~english:
         creates a new string representing the given string repeated the specified number of times.
         */
        
        let s = String(repeating: "ab", count: 10)
        print("s is \(s)")
        
        
        //MARK:public var isEmpty: Bool { get }
        /**
         \~chinese:
         返回一个Boolean值，表示一个 string 是否为空
         
         \~english:
         a Boolean value indicating whether a string has no characters.
         */
        
        //MARK:public func hasPrefix(_ prefix: String) -> Bool
        /**
         \~chinese:
         返回一个Boolean值，表明一个string 是否开始于特定的前缀
         
         \~english:
         returns  a Boolean value indicating whether the string begins with the specified prefix.
         */
        
        let cafe1 = "Cafe du Monde"
        print("cafe1.hasPrefix(",") is \(cafe1.hasPrefix("Cafe"))")
        
        //MARK:pubic func hasSuffix(_ suffix: String) -> Bool
        /**
         \~chinese:
         返回一个Bool值，判断一个string 是否以特定的string结尾
         
         \~english:
         returns a Boolean value indicating whether the string ends with the specified suffix.
         */
        
        
        //MARK:public init<T>(_ value: T, redix: Int = default, uppercase: Bool = default) where T: FixedWidthInteger
        /**
         \~chinese:
         创建一个 string, 该字符串表示基于10进制或其他指定进制的给定值。
         
         \~english:
         creates a string representing the given value in base 10, or some other specified base.
         */
        
        let v = 999_999
        
        print(String.init(v, radix: 2))
        print(String.init(v, radix: 16));
        
        print(String.init(v, radix: 16, uppercase: true))
        
        
        //MARK: public init<S>(_ characters: S) where S: Sequence, S.Element == Character
        /**
         \~chinese:
         创建一个包含给定序列中的字符的新字符串
         
         \~english:
         creates a new string containing the characters in the given sequence.
         */
        
        let  string1 = "The rain in Spain stays mainly in the plain."
        let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
        let disemvoweled = String(string1.lazy.filter{
            vowels.contains($0)
        })
        print("disemvoweled is \(disemvoweled)")
        
        //MARK: public mutating func reserveCapacity(_ n: Int)
        /**
         \~chinese:
         在字符串的底层存储中保留足够的空间, 以存储指定数量的 ASCII 字符
         
         \~english:
         reserves enough space in the string's underlying storage to store the specified number of ASCII characters.
         */
        
        //MARK: public mutating func append(_ c: Character)
        /**
         \~chinese:
         为string 增加给定的字符
         
         \~english:
         appends the given character to the string.
         */
        var globe = "Globe"
        globe.append("🍉")
        print("globe is \(globe)")
        
        
        //MARK:public mutating func append<S>(contentsOf newElements: S) where S : Sequence, S>Element == Character
        /**
         \~chinese:
         为string添加给定序列中character
         
         \~english:
         appends the characters in the given sequence to the string.
         */
        
        
        //MARK: public mutating func replaceSubrange<C>(_ bounds: Range<String.Index>, with newElements: C) where C : Collectiom, C.Element == Character
        /**
         \~chinese:
         用给定的字符集替换特定范围内的文本
         
         \~english:
         replaces the text within the specified bounds with the given characters.
         */
        
        //MARK:public mutating func insert(_ newElement: Character, at i: String.Index)
        /**
         \~chinese:
         把一个字符插入到一个string中特定的位置
         
         \~english:
         Inserts a new character at the specified position.
         */
        
        //MARK:public mutating func insert<S>(contentsOf newElement: S, at i: String.Index) where S : Collection, S.Element == Character.
        /**
         \~chinese:
         把一个Character集合插入到一个string中的特定位置
         
         \~english:
         inserts a collection of characters at the specified position.
         */
        
        //MARK:public mutating func remove(at i: String.Index) -> Character.
        /**
         \~chinese:
         removes and returns the character at the specified position.
         
         \~english:
         removes and returns the character at the specified position.
         */
        var nonempty = "non-empty"
        if let i = nonempty.index(of: "-") {
            nonempty.remove(at: i)
        }
        print("nonempty is \(nonempty)")
        
        
        //MARK:public mutating func removeSubrange(_ bounds: Range<String.Index>)
        /**
         \~chinese:
         移除给定范围内的character集合
         
         \~english:
         removes the characters in the given range.
         */
        
        
        //MARK:public mutating func removeAll(keepingCapacity: Bool = default).
        /**
         \~chinese:
         用空string替换当前string
         
         \~english:
         replaces this string with the empty string.
         */
        
        
        //MARK: public struct UTF16View : BidirectionalCollection, CustomStringConvertible, CustomDebugStringConvertible {}
        
        /**
         \~chinese:
         字符串内容的视图, 作为 UTF-16 代码单元的集合
         
         \~english:
         a view of a string's contents as a collection of UTF-16 code units.
         */
        let flowers = "Flowers"
        for v in flowers.utf16 {
            print(v)
        }
        
        let flowermoji = "🌹"
        for v in flowermoji.unicodeScalars {
            print(v, v.value)
        }
        
        for v in flowermoji.utf16 {
            print(v)
        }
        
        
        let favemoji = " My favorite emoji is 🌹"
        if let i = favemoji.utf16.index(where: { $0 >= 128}) {
            let asciiPrefix = String(favemoji.utf16[..<i])
            print(asciiPrefix)
        }
        
        print("flowers.utf16.count is \(flowers.utf16.count)")
        
        let nsflowers = flowers as NSString
        print("nsflower is \(nsflowers.length)")
        
        
        print("nsflowers.character(at:3) is \(nsflowers.character(at: 3))")
        
        let i = flowers.utf16.index(flowers.utf16.startIndex, offsetBy: 3)
        
        print("flowers.utf16[i] is \(flowers.utf16[i])")
        
        
        let snowy = "❉ Let it snow! ⛄️"
        let nsrange = NSRange(location: 2, length: 12)
        if let range = Range(nsrange, in: snowy) {
            print(snowy[range])
        }
        
        
        
        //MARK:public var utf16: String.UTF16View
        /**
         \~chinese:
         string 的 utf-16 编码
         
         \~english:
         a utf-16 encoding of self
         */
        
        
        //MARK:public struct UTF8View : BidirectionalCollection, CustomStringConvertible, CustomDebugStringConvertible {}
        /**
         \~chinese:
         字符串内容的视图, 作为 UTF-8 代码单元的集合。
         
         \~english:
         A view of a string's contents as a collection of UTF-8 code units.
         */
        
        let newFlowers = "Flowers 🌹"
        for v in newFlowers.utf8 {
            print(v)
        }
        
        let newFlowermoji = "🌹"
        for v in newFlowermoji.unicodeScalars {
            print(v, v.value)
        }
        
        for v in newFlowermoji.utf8 {
            print(v)
        }
        
        
        let s1 = "They call me 'Bell'"
        let s2 = "They call me 'Stacey'"
        
        print(strncmp(s1, s2, 14))
        
        print(String(s1.utf8.prefix(14))!)
        
        //MARK:public var utf8: String.UTF8View
        /**
         \~chinese:
         string 的 utf-8 编码
         
         \~english:
         a utf-8 encoding of self.
         */
        
        //MARK:public struct UnicodeScalarView : BidirectionalCollection, CustomStringConvertible, CustomDebugStringConvertible {}
        /**
         \~chinese:
         字符串内容的视图, 作为 Unicode 标量值的集合
         
         \~english:
         A view of a string's contents as a collection of Unicode scalar values.
         */
        
        //MARK:public init(_ unicodeScalars: String.UnicodeScalarView)
        /**
         \~chinese:
         创建一个与给定的 Unicode 标量集合相对应的字符串
         
         \~english:
         creates a string corresponding to the given collection of Unicode scalars.
         */
        
        let picnicGuest = "Deserving procupine"
        if let i = picnicGuest.unicodeScalars.index(of: " ") {
            let adjective = String(picnicGuest.unicodeScalars[..<i])
            print(adjective)
        }
        
        //MARK:public var unicodeScalars: String.UnicodeScalarView.
        /**
         \~chinese:
         字符串的值, 表示为 Unicode 标量值的集合
         
         \~english:
         the string's value represented as a collection of Unicode scalar values.
         */
        
        //MARK:public init(_ substring: Substring)
        /**
         \~chinese:
         通过给定子字符串创建一个新的字符串
         
         \~english:
         creates a new string from the given substring.
         */
        
        
        //MARK:public init?(_ codeUnits: Substring.UTF8View)
        /**
         \~chinese:
         创建一个包含给定内容的字符串
         
         \~english:
         creates a string having the given content.
         */
        
        //MARK:public init?(_ codeUnits: Substring.UTF16View)
        /**
         \~chinese:
         创建一个包含给定内容的字符串
         
         \~english:
         creates a string  having the given content.
         */
        
        
        //MARK:public init?(_ content: Substring.UnicodeScalarView).
        /**
         \~chinese:
         创建一个包含有给定内容的字符串
         
         \~english:
         creates  a string having the given content.
         */
        
        //MARK:public init(_ content: Substring.CharacterView)
        /**
         \~chinese:
         创建一个包含给定内容的字符串
         
         \~english:
         creates  a string having the given content.
         */
        
        
        
        //MARK:public func dropLast(_ n: Int) -> Substring.
        /**
         \~chinese:
         返回一个子序列不包含当前集合中给定数量的最后面的元素
         
         \~english:
         returns a subsequence containing all but the specified number of final element.
         */
        
        let numbers = [1, 2, 3, 4, 5]
        print("numbers.dropLast(2) is \(numbers.dropLast(2))")
        
        /*\chinese: 如果要除去的元素数超过了集合中与所有元素的梳理, 结果为空子序列  \english: if the number of elements to drop exceeds the number of elements in the collection, the result is an empty subsequence. */
        
        print("numbers.dropLast(10) is \(numbers.dropLast(10))")
        
        
        //MARK:public func suffix(_ maxLength: Int) -> Substring
        /**
         \~chinese:
         返回一个子序列包含当前集合的最后面的元素，它的长度为给定的最大长度
         
         \~english:
         returns a subsequence , up to the given maximum length, containing the final elements of the collection.
         */
        print("numbers.suffix(3) is \(numbers.suffix(3))")
        
        /*
         \chinese:
         如果给定的最大长度超过了当前集合中元素的数量，返回的结果包含整个集合
         
         \english:
         if maximum lenth exceeds the number of elements in the collection, the result contains the entire collection.
         */
        
        print("numbers.suffix(10) is \(numbers.suffix(10))")
        
        //MARK:public static func ...(minimum: String. maximum: String) -> ClosedRange<String>
        /**
         \~chinese:
         返回包含其(self)边界的闭合范围。
         
         \~english:
         returns a closed range that contains both of its bounds.
         */
        
        let lowercase = "a"..."z"
        print("lowercase.contains('z') is \(lowercase.contains("z"))")
        
        
        //MARK:public func map<T>(_ transform: (Character) throws -> T) rethrows -> [T]
        /**
         \~chinese:
         返回一个数组, 其中包含在序列元素上映射给定闭包的结果
         
         \~english:
         returns an array containing the results of mapping the given closure over the sequence's elements
         */
        
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        let lowercaseNames = cast.map { (str) -> String in
            str.lowercased()
        }
        print("lowercaseNames is \(lowercaseNames)")
        
        let letterCounts = cast.map { (str) -> Int in
            str.count
        }
        print("letterCounts is \(letterCounts)")
        
        
        
        //MARK:public func dropFirst(_ n: Int) -> Substring
        
        /**
         \~chinese:
         返回一个子序列，它包含当前序列的所有元素除了给定数量的开始元素
         
         \~english:
         returns a subsequence containing all but the given number of initial elements.
         */
        let numbers1 = [1, 2, 3, 4, 5]
        print("numbers1 dropFirst(2) is \(numbers1.dropFirst(2))")
        
        
        /**
         \~chinese:
         如果要丢弃的数量超过了当前集合的所有元素的数量，返回一个空子序列
         
         \~english:
         if the number of elements to drop exceeds the number of elements in the collection, the result is an empty subsequence.
         */
        
        print("numbers1.dropFirst(10) is \(numbers1.dropFirst(10))")
        
        
        
        //MARK:public func drop(while predicate: (Character) throws -> Bool) rethrows -> Substring
        /**
         \~chinese:
        通过当‘谓词’返回true时跳过当前集合中一些元素来返回剩余元素
         
         \~english:
         returns a subsequence by skipping elements while 'predicate' returns 'true' and returning the remaining elements.
         */
        let result = numbers1.drop {
            $0 < 10
        }
        print("result is \(result)")
        
        
        //MARK:public func prefix(_ maxLength: Int) -> Substring
        /**
         \~chinese:
         返回一个子序列，它包含给定的最大数量的当前集合最开始的元素
         
         \~english:
         returns a subsequence , up to the specified maximum length, containing the initial elements of the collection.
         */
        
        print("numbers.prefix(3) is \(numbers.prefix(3))")
        
        /**
         \~chinese:
         如果给定的长度超过的当前集合的所有元素的数量，返回当前集合的所有元素
         
         \~english:
         if the maximum length exceeds the number of elements in the collection, the result contains all the elements in the collection.
         */
        
        print("numbers.prefix(10) is \(numbers.prefix(10))")
        
        
        //MARK:public func prefix(while predicate: (Character) throws -> Bool) rethrows -> Substring
        /**
         \~chinese:
         返回一个子序列，它包含当前集合最开始的元素知道‘谓词’返回false 并跳过剩余的元素
         
         \~english:
         returns a subsequence containing the initial elements until 'predicate' returns 'false' and skipping the remaining elements.
         */
        
        let result1 = numbers.prefix { (n) -> Bool in
            n < 4
        }
        print("result1 is \(result1)")
        
        
        //MARK:public func prefix(upTo end: String.Index) -> Substring
        /**
         \~chinese:
         返回一个子序列，它包含从当前集合的最开始的元素到给定的位置，不包含给定位置上的元素
         
         \~english:
         returns a subsequence from the start of the collection up to, but not including, the specified position.
         */
        
        let numbers2 = [10, 20, 30, 40, 50, 60]
        if let i = numbers2.index(of: 40) {
            print("numbers2.prefix(upTo:i) is \(numbers2.prefix(upTo: i))")
        }
        
        //MARK:public func suffix(from start: String.Index) -> Substring
        /**
         \~chinese:
         返回一个子序列，它包含当前集合中从特定位置到结尾的元素
         
         \~english:
         returns a subsequence from the specified position to the end of the collection.
         */
        
        if let i = numbers2.index(of: 40) {
            print("numbers2.suffix(from:i) is \(numbers2.suffix(from: i))")
        }
        
        
        //MARK:public func prefix(through position: String.Index) -> Substring
        /**
         \~chinese:
         返回一个子序列，包含当前集合中从开始位置到给定位置的元素
         
         \~english:
         returns a subsequence from the start of the collection through the specified position.
         */
        if let i = numbers2.index(of: 40) {
            print("numbers2.prefix(through:i) is \(numbers2.prefix(through: i))")
        }
        
        
        
        //MARK:public func split(maxSplits: Int = default, omittingEmptySubsequences: Bool = default, whereSeparator is Separator: (Character) throws -> Bool) rethrows -> [Substring].
        /**
         \~chinese:
         返回当前集合中最长可能的子序列集，其中不包含按照顺序满足给定谓词的元素
         
         \~english:
         returns the longest possible subsequences of the collection, in order, that don't contain elements satisfying the given predicate.
         */
        
        let line = "BLANCHE:  I don't want realism. I want magic!"
        print(line.split(whereSeparator: { $0 == " "}))
        
        print(line.split(maxSplits: 1, whereSeparator: { $0 == " " }))
        
        print(line.split(omittingEmptySubsequences: false, whereSeparator: { $0 == " " }))
        
        print(line.split(maxSplits: 10, omittingEmptySubsequences: true, whereSeparator: { $0 == " " }))
        
        
        //MARK:public func split(separator: Character, maxSplits: Int = default, omittingEmptySubsequences: Bool = default) -> [Substring]
        /**
         \~chinese:
         以与给定元素相等的元素为单位返回集合的最长可能序列
         
         \~english:
         returns the longest possible subsequences of the collection, in order, around elements equal to the given element.
         */
        
        print(line.split(separator: " "))
        
        print(line.split(separator: " ", maxSplits: 1))
        
        print(line.split(separator: " ", omittingEmptySubsequences: false))
        
        print(line.split(separator: " ", maxSplits: 100, omittingEmptySubsequences: true))
        
        
        //MARK:public var last: Character? { get }
        /**
         \~chinese:
         返回集合中后面的一个元素
         
         \~english:
         the last element of the collection.
         */
        
        if let lastNumber = numbers.last {
            print(lastNumber)
        }
        
        
        //MARK:public func index(of element: Character) -> String.Index?
        /**
         \~chinese:
         返回当前集合中第一个给定值出现的位置索引
         
         \~english:
         returns the first index where the specified value appears in the collection.
         */
        
        var students = ["Ben", "Ivy", "Jordell", "Maxime"]
        if let i = students.index(of: "Maxime") {
            students[i] = "Max"
        }
        
        print(students)
        
        
        //MARK:public func index(where predicate: (Character) throws -> Bool) rethrows -> String.Index?
        /**
         \~chinese:
         返回当前集合中第一个满足给定谓词的元素的位置
         
         \~english:
         returns the first index in which an element of the collection safisfies the given predicate.
         */
        
        let students1 = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        if let i = students1.index(where: { $0.hasPrefix("A") }) {
            print("\(students1[i]) starts with 'A'!")
        }
        
        
        //MARK:public func sorted() -> [Character]
        /**
         \~chinese:
         返回一个新的重新排序的序列
         
         \~english:
         returns the elements of the sequence, sorted.
         */
        
        let students2: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let sortedStudents = students2.sorted()
        print("sortedStudents is \(sortedStudents)")
        
        
        //MARK:public func sorted(by areInIncreasingOrder: (Character, Character) throws -> Bool) rethrows -> [Character]
        /**
         \~chinese:
         返回一个通过给定谓词进行排序后的新的序列
         
         \~english:
         returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
         */
        
        let descendingStudents = students2.sorted { (x, y) -> Bool in
            x > y
        }
        print("descendingStudents is \(descendingStudents)")
        
        
        //MARK:public static func > (lhs: String, rhs: String) -> Bool
        /**
         \~chinese:
         返回一个Boolean值， 判断两个元素的大小
         
         \~english:
         returns  a Boolean value indicating whether the value of first argument is greater than that of the second argument.
         */
        
        //MARK:public static func <= (lhs: String, rhs: String) -> Bool
        /**
         \~chinese:
         返回一个Boolean值，判断两个元素中前面的元素是否小于等于后面的元素
         
         \~english:
         returns a Boolean value indicating whether the value of the first argument is less than or equal to that of the second argument.
         */
        
        //MARK:public static func >= (lhs: String, rhs: String) -> Bool
        /**
         \~chinese:
         返回一个Boolean值，判断两个元素中前面的的元素是否大于等于后面的元素
         
         \~english:
         returns a Boolean value indicating whether the value of the first argument is greater than or equal to that of the second argument.
         */
        
        //MARK:public static func != (lhs: String, rhs: String) -> Bool
        /**
         \~chinese:
         返回一个Boolean值，判断两个元素的值是否相等
         
         \~english:
         returns a Boolean value indicating whether two values are not equal.
         */
        
        //MARK:public var indices: DefaultIndices<String> { get }
        /**
         \~chinese:
         有效的集合的索引 (按升序排列)
         
         \~english:
         the indices that are valid for subscripting the collection, in ascending order.
         */
        
        print("numbers.indices is \(numbers.indices)")
        
        
        //MARK: public var lazy: LazySequence<String> { get }
        /**
         \~chinese:
         一个序列包含和当前序列相同的元素
         
         \~english:
         a sequence containing the same elements as this sequence.
         */
        print("numbers.lazy is \(numbers.lazy)")
        
        
        //MARK:public static func ..< (minimum: String, maximum: String) -> Range<String>
        /**
         \~chinese:
         返回一个半开放范围, 该区域包含其下限, 但不包括其上界。
         
         \~english:
         returns a half-open range that contains ite lower bound but not its upper bound.
         */
        
        let lessThanFive = 0.0..<5.0
        print(lessThanFive.contains(3.14))
        
        //MARK:prefix public static func ..< (maximum: String) -> PartialRangeUpTo<String>
        /**
         \~chinese:
         返回一个部分范围，但不包含其上限
         
         \~english:
         Returns a partial range up to, but not including, its upper bound.
         */
        
        let upToFive = ..<5
        print("upToFive.contains(Int(3.14)) is \(upToFive.contains(Int(3.14)))")
        print("upToFive.contains(Int(6.28)) is \(upToFive.contains(Int(6.28)))")
        
        
        //MARK:prefix public static func ...(maximum: String) -> ParialRangeThrough<String>
        /**
         \~chinese:
         返回一个部分范围，包含其上限
         
         \~english:
         returns a paritial range up to, and including, its upper bound.
         */
        
        let throughFive = ...5.0
        print("throughFive.contains(4.0) is \(throughFive.contains(4.0))")
        print("throughFive.contains(5.0) is \(throughFive.contains(5.0))")
        print("throughFive.contains(6.0) is \(throughFive.contains(6.0))")
        
        //MARK:postfix public static func ...(minimum: String) -> PartialRangeFrom<String>
        /**
         \~chinese:
         返回从下界向上延伸的部分范围
         
         \~english:
         returns a partial range extending upward from a lower bound.
         */
        let atLeastFive = 5.0...
        print("atLeastFive.contains(4.0) is \(atLeastFive.contains(4.0))")
        print("atLeastFive.contains(5.0) is \(atLeastFive.contains(5.0))")
        print("atLeastFive.contains(6.0) is \(atLeastFive.contains(6.0))")
        
        
        //MARK:public subscript<R>(r:R) -> Substring where R : RangeExpression, String.Index == R.Bound { get }
        /**
         \~chinese:
         访问由 range 表达式指定的集合元素的连续 subrange
         
         \~english:
         accesses the contiguous subrange of the collection's elements specified by a range expression.
         */
        
        let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        let streetSlice = streets[2...]
        print("streetSlice is \(streetSlice)")
        
        
        //MARK:public convenience init(repeating repeatedValue: Character, count: Int)
        /**
         \~chinese:
         创建一个包含指定数目的单个重复值的新集合
         
         \~english:
         creates a new collection containing the specified number of a single, repeated value.
         */
        
        let fiveZs = Array(repeating: " nidayede", count: 10)
        print("fiveZs is \(fiveZs)")
        
        //MARK:public convenience init<S>(_ elements: S) where S : Sequence, Character == S.Element.
        /**
         \~chinese:
         创建一个新的集合包含一个序列中的元素
         
         \~english:
         creates  a new instance of a collection containing the elements of a sequence.
         */
        
        //MARK:public mutating func append(_ newElement: Character)
        /**
         \~chinese:
         在一个集合的结尾添加一个元素
         
         \~english:
         adds an element to the end of the collection.
         */
        var newNumbers = [1, 2, 3, 3, 5]
        newNumbers.append(100)
        print("newNumbers.append(100) is \(newNumbers)")
        
        
        //MARK:public mutating func append<S>(contentsOf newElement: S) where S : Sequence, Character == S.Element
        /**
         \~chinese:
         增加一个序列或集合中的元素到当前集合的尾端
         
         \~english:
         adds the elements of a sequence or collection to the end of this collecion.
         */
        newNumbers.append(contentsOf: 10...15)
        print("newNumbers.append(contentOf: 10...15) is \(newNumbers)")
        
        
        //MARK:public mutating func insert(_ newElement: Character, at i: String.Index)
        /**
         \~chinese:
         插入一个新的元素到当前集合的特定位置
         
         \~english:
         inserts a new element into the collection at the specified position.
         */
        
        newNumbers.insert(10000, at: 3)
        print("newNumbers.insert(10000, at: 3) is \(newNumbers)")
        
        
        //MARK:public mutating func insert<C>(contentOf newElements : C, at i:String.Index) where C : Collection, Character == C.Element.
        /**
         \~chinese:
         插入一个序列到当前集合中的特定元素
         
         \~english:
         inserts the elements of a sequence into the collection at the specified position.
         */
        
        newNumbers.insert(contentsOf: 2000...2003, at: 3)
        
        print("newNumbers.insert(contentsOf: 2000...2003, at: 3) is \(newNumbers))")
        
        
        //MARK:public mutating func remove(at position: String.Index) -> Character.
        /**
         \~chinese:
         移除并返回一个集合中特定位置的元素
         
         \~english:
         removes and returns the element at the specified position.
         */
        newNumbers.remove(at: newNumbers.startIndex)
        print("newNumbers.remove(at: newNumbers.endIndex) is \(newNumbers))")
        
        
        //MARK:public mutating func removeSubrange(_ bounds: Range<String.Index).
        /**
         \~chinese:
         移除当前集合中特定子范围中的元素
         
         \~english:
         removes the elements in the specified subrange from the collection.
         */
        
        newNumbers.removeSubrange(1..<4)
        print("newNumbers.removeSubrange(1..<4) is \(newNumbers)")
        
        
        //MARK:public mutating func removeFirst(_ n: Int).
        /**
         \~chinese:
         从当前集合开始位置移除特定数量的元素
         
         \~english:
         removes the specified number of elements from the beginning of the collection.
         */
        
        newNumbers.removeFirst(3)
        print("newNumbers.removeFirst(3) is \(newNumbers)")
        
        
        //MARK:public mutating func removeFirst() -> Character.
        /**
         \~chinese:
         移除并返回当前集合的首个元素
         
         \~english:
         removes and returns the first element of the collection.
         */
        
        //MARK:public mutating func removeAll(keepingCapacity keepCapcity: Bool = default).
        /**
         \~chinese:
         移除当前集合的所有元素
         
         \~english:
         removes all elements from the collection.
         */
        
        
        //MARK:public mutating func reserveCapacity(_ n: Int)
        /**
         \~chinese:
         当这样做适合于基础类型时, 准备集合以存储指定数量的元素。
         
         \~english:
         prepares the collection to store the specified number of elements , when doing so is appropriate for the underlying type.
         */
        
        //MARK:public mutating func replaceSubrange<C, R>(_ subrange: R, with newElements: C) where C : Collection, R : RangeExpression, Character == C.Element, String.Index == R.Bound.
        
        /**
         \~chinese:
         用给定集合替换当前集合中特定范围内的元素
         
         \~english:
         replaces the specified subrange of elements with the given collection.
         */
        
        newNumbers.replaceSubrange(1...3, with: [8, 8, 8, 8, 8, 8])
        print("newNumbers.replaceSubrange(1...3, with: [8, 8, 8, 8, 8, 8]) is \(newNumbers)")
        
        
        //MARK:public mutating func removeSubrange<R>(_ bound: R) where R : RangeExpression, String.Index == R.Bound.
        /**
         \~chinese:
         从当前集合中移除给定范围内的元素
         
         \~english:
         removes the elments in the specified subrange from the collection.
         */
        
        newNumbers.removeSubrange(1..<4)
        print("newNumbers.removeSubrange(1..<4) is \(newNumbers)")
        
        
        //MARK:public mutating func removeLast() -> Character
        /**
         \~chinese:
         移除并返回当前集合中的最后一个元素
         
         \~english:
         removes and returns the last element of the collection.
         */
        
        //MARK:public mutating func removeLast(_ n: Int).
        /**
         \~chinese:
         从当前集合的最后一个元素开始向前移除并返回特定数量的元素
         
         \~english:
         removes the specified number of elements from the end of the collection.
         */
        
        
        //MARK:@available(swift 4.0) public func filter(_ isIncluded: (Character) throws -> Bool) rethrows -> String
        
        /**
         \~chinese:
         返回相同类型的新集合, 其包含满足给定谓词的原始集合的元素
         
         \~english:
         returns a new collection of the same type containing, in order, the elements of the original collection that satisfy the given predicate.
         */
        
        let shortNames = cast.filter { (str) -> Bool in
            str.count < 5
        }
        print("shortNames is \(shortNames)")
        
        
        //MARK:public func reversed() -> ReversedCollection<String>
        /**
         \~chinese:
         返回一个视图以倒序方式呈现当前集合的元素
         
         \~english:
         returns a view presenting the elements of the collection in reverse order.
         */
        
        let word = "Backwards"
        for char in word.reversed() {
            print(char)
        }
        
        
        //MARK:public func map<T>(_ transform: (Character) throws -> T) rethrows -> [T]
        /**
         \~chinese:
         返回一个数组, 其包含当前序列元素映射给给定闭包的结果
         
         \~english:
         returns an array containing the results of mapping the given closure over the sequence's elements.
         */
        
        let newlowercaseNames = cast.map { (x) -> String in
            x.lowercased()
        }
        print("lowercaeNames is \(newlowercaseNames)")
        
        let newletterCounts = cast.map { (x) -> Int in
            x.count
        }
        print("newletterCounts is \(newletterCounts)")
        
        
        //MARK:public var underestimatedCount: Int { get }
        /**
         \~chinese:
         返回一个小于或等于序列中的元素数的值, 无损检测
         
         \~english:
         returns a value less than or equal to the number of elements in the sequence, nondestructively.
         */
        print("newletterCounts.underestimatedCount is \(newletterCounts.underestimatedCount)")
        
        
        //MARK:public func forEach(_ boby: (Character) throws -> Void) rethrows.
        /**
         \~chinese:
         对当前序列中的每个元素调用给定的闭包，和for-in 循环的顺序一样
         
         \~english:
         calls the given closure on each element in the sequence in the same order as a 'for'-'in' loop.
         */
        
        let numberWords = ["one", "two", "three"]
        for word in numberWords {
            print(word)
        }
        
        
        //MARK:
        /**
         \~chinese:
         返回当前序列中第一个满足给定谓词的元素
         
         \~english:
         returns the first element of the sequence that satisfies the given predicate.
         */
        
        let anotherNumbers = [3, 7, 4, -2, 9, -6, 10, 1]
        if let firstNegative = anotherNumbers.first(where: { (x) -> Bool in
            x < 0
        }) {
            print("the first negative numbere is \(firstNegative)")
        }
        
        
        //MARK:public func dropFirst() -> Substring
        /**
         \~chinese:
         返回一个不包含当前序列中首个元素的子序列
         
         \~english:
         returns a subsequence containing all but the first element of the sequence.
         */
        
        print("anotherNumbers is \(anotherNumbers.dropFirst())")
        
        //MARK:public func dropLast() -> Substring.
        /**
         \~chinese:
         返回一个不包含当前序列最后一个元素的子序列
         
         \~english:
         returns a subsequence containing all but the last element of the sequence.
         */
        
        print("anotherNumbers.dropLast() is \(anotherNumbers.dropLast())")
        
        
        //MARK:public func enumerated() -> EnumeratedSequence<String>
        /**
         \~chinese:
         返回一对 (* n * , * x *) 的序列, 其中 * n * 表示从零开始的连续整数, * x *表示序列的一个元素
         
         \~english:
         returns a sequence of pairs (* n *, * x *), where * n * represents a consecutive integer starting at zero and * x * represents an element of the sequence.
         */
        
        for (n, c) in "swift".enumerated() {
            print("\(n), \(c)")
        }
        
        
        //MARK:@warn_unqualified_access  public func min(by areIncreasingOrder: (Character, Character) throws -> Bool) rethrows -> Character?
        /**
         \~chinese:
         返回当前序列中最小的元素，使用给定的谓词两两元素之间进行比较
         
         \~english:
         returns the minumum element in the seauence, using the given predicate as the comparison between elements
         */
        
        let newHues = ["Heliotrop": 296, "Coral": 16, "Aquamarine": 156]
        let leastHue = newHues.min { (x, y) -> Bool in
            x.value < y.value
        }
        print("leastHue is \(leastHue)")
        
        
        //MARK:@warn_unqualified_access  public func max(by areIncreasingOrder: (Character, Character) throws -> Bool) rethrows -> Character?
        /**
         \~chinese:
         返回当前序列中最大的元素，使用给定的谓词两两元素之间进行比较
         
         \~english:
         returns the maximum element in the seauence, using the given predicate as the comparison between elements
         */
        let leastHue1 = newHues.min { (x, y) -> Bool in
            x.value > y.value
        }
        print("leastHue1 is \(leastHue1)")
        
        
        //MARK:@warn_unqualified_access public func min() -> Character?
        /**
         \~chinese:
         返回当前序列中最小的元素
         
         \~english:
         returns the minimum element in the sequence.
         */
        
        let heights = [67.5, 65.7, 64.3, 61.1, 58.5, 60.3, 64.9]
        print("hegiths.min() is \(heights.min()!)")
        
        //MARK:@ware_unqualified_access public func max() -> Character?
        /**
         \~chinese:
         返回当前序列中最大的一个元素
         
         \~english:
         returns the maximum element in the sequence.
         */
        
        print("heights.max() is \(heights.max()!)")
        
        
        //MARK:
        /**
         \~chinese:
         返回一个Boolean值，判断当前序列的初始的元素是否等于另外一个序列中的元素，使用给定谓词作为等于测试
         
         \~english:
         returns a Boolean value indicating whether the initial elements of the sequence are equivalent to the elements in another sequence, using the given predicate as the equivalence test.
         */
        
        let initial = [1, 2, 3, 4, 5, 6]
        let anotherInitial = [1, 2, 3]
        print("initial.starts(with: anotherInitial, by: { (x, y) -> Bool in x == y }) is \(initial.starts(with: anotherInitial, by: { (x, y) -> Bool in x == y }))")
        
        
        //MARK:public func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix) -> Bool where PossiblePrefix : Sequence, Character == PossiblePrefix.Element
        
        /**
         \~chinese:
         返回一个Boolean值，判断当前序列的初始的元素是否等于另外一个序列中的元素
         
         \~english:
         returns a Boolean value indicating whether the initial elements of the sequence are the same as the elements in another sequence.
         */
        let a = 1...3
        let b = 1...10
        print("b.starts(with: a) is \(b.starts(with: a))")
        
        
        //MARK:public func elementsEqual<OtherSequence>(_ other: OtherSequence, by areEquivalent: (Character, OtherSequence.Elment) throws -> Bool) rethrows -> Bool where OtherSequence : Sequence
        
        /**
         \~chinese:
         返回一个布尔值, 指示此序列和另一个序列是否以相同的顺序包含等效元素, 使用给定谓词作为等价测试
         
         \~english:
         returns a Boolean value indicating whether this sequence and another sequence contain equivalent elements in the same order, using the given predicate as the equivalence test.
         */
        
        
        //MARK:public func elementsEqual<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, Character == OtherSequence.Element.
        /**
         \~chinese:
         返回一个布尔值, 指示此序列和另一个序列是否以相同的顺序包含相同的元素
         
         \~english:
         returns a Boolean value indicating whether this seauence and another sequence contain the same elements in the same order
         */
        
        print("a.elementsEqual(b) is \(a.elementsEqual(b))")
        print("a.elementsEqual([1, 2, 3]) is \(a.elementsEqual([1, 2, 3]))")
        
        
        //MARK:public func lexicographicallyPrecedes<OtherSequence>(_ other: OtherSequence, by areInIncreasingOrder: (Character, Character) throws -> Bool) rethrows -> Bool where OtherSequence : Sequence, Character == OtherSequence.Element
        /**
         \~chinese:
         返回一个Boolean值，判断当前序列是否以辞书的顺序在另一个序列前面， 使用给定的谓词进行比较
         
         \~english:
         returns a Boolean vlaue indicating whether the sequence precedes another sequence in a lexicographical ordering, using the given predicate to compare elements.
         */
        let newInitial = [1, 2, 3, 4, 5, 6]
        let anotherNewInitial = [1, 12, 11, 5, 8, 9, 10]
        print(anotherNewInitial.lexicographicallyPrecedes(newInitial, by: { (x, y) -> Bool in
            x == y
        }))
        
        
        //MARK:public func lexicographicallyPrecedes<OtherSequence>(_ other: OtherSequence) -> Bool where OtherSequence : Sequence, Character == OtherSequence.Element
        /**
         \~chinese:
         返回一个Boolean值，判断当前序列是否以辞书的顺序在另一个序列前面， 使用给定的'<'进行比较
         
         \~english:
         Returns a Boolean value indicating whether the sequence precedes another sequence in a lexicographical (dictionary) ordering, using the less-than operator (`<`) to compare elements.
         */
        
        //MARK:public func contains(_ element: Character) -> Bool
        /**
         \~chinese:
         返回一个Boolean 值， 判断当前序列是否包含给定的元素
         
         \~english:
         returns a Boolean value indicating whether the sequence contains the given element.
         */
        
        
        //MARK:public func contains(where predicate: (Character) throws -> Bool) rethrows -> Bool
        /**
         \~chinese:
         返回一个Boolean值，判断当前序列是否包含满足给定谓词的元素
         
         \~english:
         returns a Boolean value indicating whether the sequence contains an element that satisfies the given predicate.
         */
        
        //MARK:public func reduce<Result>(_ initalResult: Result, _ nextPartialResult: (Result, Character) throws -> Result) rethrows -> Result
        
        /**
         \~chinese:
         返回使用给定闭包组合序列元素的结果
         
         \~english:
         returns the result of combining the elements of the sequence using the given closure.
         */
        
        let anotherNumbers1 = [1, 2, 3, 4]
        let numbersSum = anotherNumbers1.reduce(0) { (x, y) -> Int in
            x + y
        }
        
        print("numbersSum is \(numbersSum)")
        
        
        //MARK:public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Character) throws -> ()) rethrows -> Result
        /**
         \~chinese:
         返回使用给定闭包组合序列元素的结果
         
         \~english:
         returns the result of combining the elements of the sequence using the given closure.
         */
        
        let newLetters = "abracadabra"
        let newLetterCount = newLetters.reduce(into: [:]) { (counts, letter) in
            counts[letter, default: 0] += 1
        }
        print("newLetterCount is \(newletterCounts)")
        
        
        //MARK:public func compactMap<ElementOfResult>(_ transform: (Character) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
        /**
         \~chinese:
         返回一个数组, 包含使用此序列的每个元素调用给定转换的非 "零" 结果
         
         \~english:
         returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
         */
        
        let possibleNumbers = ["1", "2", "three", "///4///", "5"]
        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
        print("mapped is \(mapped)")
        
        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
        
        print("compactMapped is \(compactMapped)")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension String {
    public func withCString<Result>(_ body: (UnsafePointer<Int8>) throws -> Result) rethrows -> Result {
        return try self.utf8CString.withUnsafeBufferPointer {
            try body($0.baseAddress!)
        }
    }
}

