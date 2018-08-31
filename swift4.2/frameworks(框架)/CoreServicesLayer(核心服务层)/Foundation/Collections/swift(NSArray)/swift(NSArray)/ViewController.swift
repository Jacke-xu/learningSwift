//
//  ViewController.swift
//  swift(NSArray)
//
//  Created by 范云飞 on 2018/8/5.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //MARK:-------------------------------- extension array ---------------------------------------
        //MARK:init()
        var emptyArray = Array<Int>()
        print(emptyArray.isEmpty)//true
        
        emptyArray = []
        print(emptyArray.isEmpty)//true
        
        //MARK:init(_:): create an array containing the elements of a sequence
        let number = Array(1...7)
        print(number)//[1, 2, 3, 4, 5, 6, 7]
        
        let namedHues: [String: Int] = ["Vermillion": 18, "Magenta": 302, "Gold": 50, "Cerise": 320]
        let colorNames = Array(namedHues.keys)
        cacheImagesWithNames(names: colorNames)//["Magenta", "Vermillion", "Gold", "Cerise"]
        let colorValues = Array(namedHues.values)
        cacheImagesWithNames(names: colorValues)//[302, 18, 50, 320]
        
        //MARK:init(repeating:count:): creates a new array containing the specified number of a single, repeated value.
        let fiveZs = Array(repeating: "Z", count: 5)
        print(fiveZs)//["Z", "Z", "Z", "Z", "Z"]
        
        //MARK:count: the number of elements in the array && capacity: the total number of elements that array can contain without allocating new storage
        var numbers = [10, 20, 30, 40, 50]
        print(numbers.count)//5
        numbers.append(contentsOf: stride(from: 60, through: 100, by: 20))
        print(numbers)
        print(numbers.capacity)//5
        
        //MARK:reserveCapacity(_:): reserves enough space to store the specified number of elements
        let values = [0, 1, 2, 3]
        print(addTenQuadratic(values))//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
        
        
        //MARK:append(_:): adds a new element at the end of the array
        numbers.append(100)
        print(numbers)//[10, 20, 30, 40, 50, 100]
        
        //MARK:append(contentOf:): adds the elements of a sequence to the end of the array
        numbers.append(contentsOf: 10...15)
        print(numbers)//[10, 20, 30, 40, 50, 100, 10, 11, 12, 13, 14, 15]
        
        
        //MARK:insert(_:at:): inserts a new element at the apecified position
        numbers.insert(101, at: 0)
        print(numbers)//[101, 10, 20, 30, 40, 50, 100, 10, 11, 12, 13, 14, 15]
        
        //MARK:remove(at:): removes and returns the element at the specitfied position
        var measurements: [Double] = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
        let removed = measurements.remove(at: 2)
        print(measurements)
        
        
        //MARK:removeAll(keepingCapacity:): removes all elements from the array
        measurements.removeAll(keepingCapacity: true)
        print(measurements)
        
        //MARK:customMirror： a mirror that reflects the array
        print(numbers.customMirror)
        print(measurements.customMirror)
        
        //MARK:init(arrayLiteral:)
        let ingredients = ["cocoa beans", "sugar", "cocoa butter", "salt"]
        let anotherIngredients = ["new cocoa beans"]
        var newIngredients:[Array] = Array.init(arrayLiteral: ingredients)
        print(newIngredients)
        newIngredients.append(anotherIngredients)
        print(newIngredients)
        print(newIngredients[1])
        for element in newIngredients {
            print(element)
        }
        
        
        //MARK:descriptiion: a textual representation of the array and its elements
        print(ingredients.description)
        
        //MARK:debugDescription: a textual representation of the array and its elements, suitable for
        print(values.debugDescription)
        
        //MARK:Index: the index type of array
        print(values.index(of: 3)!)
        
        //MARK:Indices: the type that represents the indices that are valid for subscripting an array, in ascending order
        print(values.indices)
        
        //MARK:Iterator
        print(values.makeIterator())
        
        //MARK:startIndex: the position of the first element in a nonempty array，if the array is empty, 'endIndex' is equal to 'startIndex'.
        print(values.startIndex)
        print(values.endIndex)
        
        //MARK:index(after:): return the position immediately after the given index
        print(values.index(after: 0))
        
        //MARK:formIndex(after:): replaces the given index with its successor
        var firstElement = 1
        print(values.formIndex(after: &firstElement))
        print(values.formIndex(before: &firstElement))
        print(values)
        
        
        //MARK:index(_:offsetBy:):  returns an index that is the specified distance from the given index
        //FIXME:the value passed as 'n' must not offset 'i' beyond the bounds of the collection.返回一个距离给定值长度为 n 的 Int 类型型，当 n 超过newNumbers的 count 时 newNumbers[i] 不存在报错
        let newNumbers = [10, 20, 30, 40, 50]
        let i = newNumbers.index(newNumbers.startIndex, offsetBy: 7)
        print(i)
        
        // the value passed as 'n' must not offset 'i' beyond the bounds of the collection, unless the index passed as 'limit' prevents offseting beyond those bounds
        //如果n 的长度超过了 newNumbers的 count  方法将会返回 nil
        let j = newNumbers.index(newNumbers.startIndex, offsetBy: 2, limitedBy: newNumbers.endIndex)
        print(j!)
        
        //MARK:distance(from:to:)
        let anotherNumbers = [1, 3, 5, 7, 8, 9]
        print(anotherNumbers.distance(from: anotherNumbers[0], to: anotherNumbers[4]))
        
        
        //MARK:subscript(_:): accesses the element at the specified position. 访问指定位置的元素
        var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        streets[1] = "Butler"
        print(streets[1])
        
        //MARK:subscript(bounds) accesses a contiguous subrange of the array's elements. 访问一个数组中的连续的子集(片段)
        let anotherStreets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        let streetsSlice = anotherStreets[2 ..< anotherStreets.endIndex]
        print(streetsSlice)
        
        //MARK:joined() return the elements of this sequence of sequences , concatenated.
        
        let ranges = [0..<3, 8..<10, 15..<17]
        for range in ranges {
            print(range)
        }
        
        // use 'joined()' to access each element of each range:
        print(ranges.joined())
        
        for index in ranges.joined() {
            print(index)
        }
        
        //MARK:joined(separator:): return the concatented elements of this sequence of sequences, inserting the given separator between each element
        let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        let joined = nestedNumbers.joined(separator: [-1, -2])
        print(joined)
        print(Array(joined))
        
        //MARK:return a new string by concatenating the elements of the sequence , adding the given separator between each element. 返回一个新的字符串，用给定的字符，把集合中的元素重新连接起来
        
        let cast = ["Vivien", "Marlon", "Kim", "Karl"]
        let list = cast.joined(separator: ", ")
        print(list)
        
        //MARK: split(separator:maxSplits:omittingEmptySubsequences:)
        let line = "BLANCHR:  I don't want realism. I want magic!"
        
        /**
         separator : the element that should be split upon
         maxSplits : the maximum number of times to split the collection
         omittingEmptySubsequences : if 'false' , an empty subsequence is returned in the rusult for each consecutive pair of 'separator' elements in the collection and for each instance of 'separator' at the start or end of the collection. if 'true', only nonempty subsequences are returned. the default value is 'true'
         */
        print(line.split(separator: " "))
        
        print(line.split(separator: " ", maxSplits: 1))
        
        print(line.split(separator: " ", omittingEmptySubsequences: true))
        
        print(line.split(separator: " ", maxSplits: 0, omittingEmptySubsequences: false))

        
        //MARK:index(of:): return the index  where the specified value appears in the collection. 获取给定元素的对应的索引
        var students = ["Ben", "Ivy", "Jordell", "Maxime"]
        if let i = students.index(of: "Maxime") {
            students[i] = "Max"
        }
        print(students)
        
        
        //MARK: != (_:_:) return a Boolean value indicating whether two values are not equal
        let compareArray = [1, 3, 4, 6], compareArrayB = [1, 3, 6, 4]
        print(compareArray == compareArrayB)
        
        //MARK:starts(with:): return a Boolean value indicating whether the initial elements of the sequence are the same as the elements in another sequencce. 比较连个集合是否拥有相同的元素
        
        let a = 1...3
        let b = 1...10
        print(b.starts(with: a))
        
        
        //MARK:elementsEqual(_:): return a Boolean value indicating whether this sequence and another sequence contain the same elements in the same order
        print(a.elementsEqual(b))
        print(a.elementsEqual([1, 2, 3]))
        
        
        //MARK:contains(_:): return a Boolean value indicating whether the sequence contains the given element
        print(cast.contains("Marlon"))
        print(cast.contains("James"))
        
        //MARK:sorted(): return the elements of the sequence, sorted
        let anotherStudents: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let sortedStudents = anotherStudents.sorted()
        print(sortedStudents)
        
        
        //MARK:mutating func sort(): sorts the collection in place
        
        var newStudents = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        newStudents.sort()
        print(newStudents)
        
        
        //MARK:min: return the minimum element in the sequence.
        let heights: [Double] = [67.5, 65.7, 64.3, 61.1,58.5, 60.3, 64.9]
        print(heights.min()!)
        
        //MARK:max: return the maximum element, if the sequence has no element, returns 'nil'
        print(heights.max()!)
        
        //MARK:lexicographicallyPrecedes(_:)
        
        let A = [1, 2, 2, 2]
        let B = [1, 2, 3, 4]
        print(A.lexicographicallyPrecedes(B))
        
        //MARK:---------------------------------- array ---------------------------------
        
        //MARK:withUnsafeBufferPointer(_:): calls a closure with a pointer to the array's contiguous storage.
        let anotherNums = [1, 2, 3, 4, 5]
        let sum = anotherNums.withUnsafeBufferPointer { buffer -> Int in
            var result = 0
            print(stride(from: buffer.startIndex, to: buffer.endIndex, by: 2))
            for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 2) {
                result += buffer[i]
            }
            return result
        }
        
        print(sum)
        
        //MARK:withUnsafeMutableBufferPointer(_:): call the given closure with a pointer to the array's mutable contiguous storage
        var anotherNewNums = [1, 2, 3, 4, 5]
        anotherNewNums.withUnsafeMutableBufferPointer { buffer in
            for i in stride(from: buffer.startIndex, to: buffer.endIndex - 1, by: 2) {
                buffer.swapAt(i, i + 1)
            }
        }
        print(anotherNewNums)
        
        
        //MARK:withUnsafeMutableBytes(_:)
        /* [UInt8] 转化为 [Int32] */
        var newNumbers1: [Int32] = [0, 0]
        let newByteValues: [UInt8] = [0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00]
        
        newNumbers1.withUnsafeMutableBytes { destBytes in
            newByteValues.withUnsafeBytes { srcBytes in
                destBytes.copyMemory(from: srcBytes)
                
            }
        }
        print("newNumbers1 is \(newNumbers1)")
        
        
        newNumbers1.withUnsafeMutableBytes { destBytes in
            newByteValues.withUnsafeBytes{ srcBytes in
                destBytes.copyMemory(from: srcBytes)
            }
        }
        
        print(newNumbers1)
        
        //MARK:withUnsafeBytes(_:)
        /* [Int32] 转化为 [UInt8] */
        let newNumbers2: [Int32] = [1, 2, 3]
        var byteBuffer: [UInt8] = []
        newNumbers2.withUnsafeBytes {
            byteBuffer.append(contentsOf: $0)
            print($0)
        }
        print("byteBuffer is \(byteBuffer)")
        
        
        //MARK:replaceSubrange(_:with:): replace a range of elements with the elements in the specified collection
        var nums = [10, 20, 30, 40, 50]
        nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
        print(nums)
        
        
        var anotherNum: [Int32] = [0, 0]
        let byteValues: [UInt8] = [0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00]
        anotherNum.withUnsafeMutableBytes { destBytes in
            byteValues.withUnsafeBytes({ srcBytes in
                destBytes.copyMemory(from: srcBytes)
            })
        }
        
        print(anotherNum)
        
        
        //MARK:popLast(): removes and retruns the last element of the array
        print(nums.popLast() as! Int)
        
        //MARK:dropLast(_:): return a subsequence containing all but the specified number of final element.
        print(nums.dropLast(2))
        
        //MARK:func suffix(_ maxLength: Int) -> ArraySlice<Element>:
        /**
         1. returns a subsequence, up to the given maximum length, containing the final elements of the collection
         2. if the maximum length exceeds the number of elements in the collection, the result contains the entire collection
         */
        let num1 = [1, 2, 3, 4, 5]
        print(num1.suffix(3))
        print(num1.suffix(from: 1))
        print(num1.suffix(10))
        
        //MARK:func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]:
        /**
         1. returns an array containing the results of mapping the given closure over the sequence's elements
         2. in next example , 'map' is used first to convert the names in the array to lowercase strings and then to count their characters.
         */
        
        let cast1 = ["Vivien", "Marlon", "Kim", "Karl"]
        let lowercaseNames = cast1.map { $0.lowercased() }
        print(lowercaseNames)
        
        let letterCounts = cast1.map { $0.count }
        print(letterCounts)
        
        /**
         a mapping closure. 'transform' accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type
         */
        
        
        //MARK:func prefix(_ maxLength: Int) -> ArraySlice<Element>:
        /**
         1. return a subsequence, up to the specified maximum length, containing the initial elements of the collection.
         2. if the maximum length exceeds the number of elements in the collection, the result contains all the elements in the collection.
         */
        
        let num2 = [1, 2, 3, 4, 5]
        print(num2.prefix(2))
        print(num2.prefix(10))
        
        //MARK:func prefix(upTo end: Int) -> ArraySlice<Element>
        /**
         1. return a subsequence from the start of the collection up to, but not including, the specified position
         2. the resulting subsequence 'does not include ' the element at the position 'end'. the following example searches for the index of the number '40' in an array of integer, and then prints the prefix of the array up to, but not including,that index:
         */
        
        let num3 = [10, 20, 30, 40, 50, 60]
        if let i = num3.index(of: 40) {
            print(num3.prefix(upTo: i))
        }
        
        print(num3.prefix(upTo: num3.startIndex))
        
        if let i = num3.index(of: 40) {
            print(num3[..<i])
        }
        
        //MARK:func prefix(through position: Int) -> ArraySlice<Element>:
        /**
         1. return a subsequence from the start of the collection through 'end'
         2. the following example searches for the index of the number '40' in an array of integers , and then prints the prefix of the array up to, and then prints the prefix of the array up to, and including, that index:
         */
        
        let num4 = [10, 20, 30, 40, 50, 60]
        if let i = num4.index(of: 40) {
            print(num4.prefix(through: i))
        }
        
        
        //MARK:var last: Element? { get }
        /**
         the last element of the collection
         */
        let num5 = [10, 20, 30, 40, 50]
        if let lastNumber = num5.last {
            print(lastNumber)
        }
        
        //MARK:func index(where predicate: (element) throw -> Bool) rethrows -> Int?
        /**
         returns the first index in which an element of the collection satisfies the given predicate.
         */
        let num6 = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        if let i = num6.index(where: { $0.hasPrefix("A") }){
            print("\(num6[i]) starts with 'A'!")
        }
        
        //MARK:func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
        /**
         return the elements of the collection, sorted using the given predicate as the comparison between elements.
         */
        enum HTTPResponse {
            case ok
            case error(Int)
        }
        
        let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
        let sortedResponses = responses.sorted {
            switch ($0, $1) {
            case let (.error(aCode), .error(bCode)):
                return aCode < bCode
            case (.ok, .ok):
                return false
            case (.error, .ok):
                return true
            case (.ok, .error):
                return false
            }
        }
        print(sortedResponses)
        
        //MARK:func swapAt(_ i: Int _ j: Int):
        /**
         exchanges the values at the specified indices of the collection.
         */
        var num9 = [1, 2, 3, 4]
        let n = num9.index(of: 2)
        let m = num9.index(of: 3)
        num9.swapAt(n!, m!)
        print("num9 is \(num9)")
    
        //MARK:var indices: CountableRange<Int> { get }:
        /**
         the indices that are valid for subscripting the collection, in ascending order.
         */
        print("num9.indices is \(num9.indices)")
        
        
        //MARK:subscript<R>(r: R) -> ArraySlice<Element> where R : RangeExpression, Array.Index == R.Bound { get }
        /**
         the range contiguous subrange of the collection's elements specified by a range expression
         */
        let streets1 = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        let streetsSlice1 = streets1[2...]
        print("streetsSlice1 is \(streetsSlice1)")
        
        //MARK:public convenience init<S>(_ elements:S) where S: Sequece, Element == S.Element:
        /**
         create a new instance of a collection containing the elements of a sequence
         */
        let streets2 = Array.init(streets1)
        print("streets2 is \(streets2)")
        
        
        //MARK:mutating func append<S>(contentsOf newElements:S) where S: Sequence, Element == S.Element:
        /**
         adds the elements of a sequence or collection to the end of this collection.
         */
        var num10 = [1, 2, 3, 4, 5]
        num9.append(contentsOf: 10...15)
        print(num10)
        
        
        //MARK:mutating func insert(_ newElement: Element,at i: Int):
        /**
         inserts a new element into the collection at the specified position
         */
        var num11 = [1, 2, 3, 4, 5]
        num11.insert(100, at: 3)
        num11.insert(200, at: num11.endIndex)
        print(num11)
        
        
        //MARK:mutating func insert<C>(contentsOf newElement:C, at i: Int) where C: Collection, Element == C.Element:
        /**
         inserts the elements of a sequence into the collection at the specified position
         */
        
        var num12 = [1, 2, 3, 4, 5]
        num12.insert(contentsOf: 100...110, at: 3)
        print(num12)
        
        //MARK:mutating func remove(at position: Int) -> Element:
        /**
         removes and returns the element at the specified position
         */
        var measurements1 = [1.2, 1.5, 2.9, 1.2, 1.6]
        let removed1 = measurements1.remove(at: 2)
        print(removed1)
        print(measurements1)
        
        
        //MARK:mutating func removeSubrange(_ bounds: Range<Int>):
        /**
         removes the elements in the specified subrange from the collection.
         */
        var measuremetns2 = [1.2, 1.5, 2.9, 1.2, 1.5, 1.5, 1.5]
        measuremetns2.removeSubrange(1..<4)
        print(measuremetns2)
        
        //MARK:mutating func removeFirst(_ n: Int):
        /**
         removes the specified number of elements from the beginning of the collection
         */
        var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
        bugs.removeFirst(3)
        print(bugs)
        
        //MARK:mutating func removeFirst() -> Element:
        /**
         removes and returns the first element of the collection.
         */
        var bugs1 = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
        print(bugs1.removeFirst())
        
        //MARK:mutating func removeLast(_ n: Int):
        /**
         removes the specified number of elements from the end of the collection. 删除从最后一个元素向前给定长度的元素
         */
        
        var bugs2 = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
        bugs2.removeLast(3)
        print("bugs2 is \(bugs2)")
        
        
        //MARK:mutating func reverse():
        /**
         reverses the elements of the collection in place.
         */
        var characters: [Character] = ["C", "a", "f", "e"]
        characters.reverse()
        print(characters)
        
        
        //MARK:func reversed() -> ReversedCollection<Array<Element>>:
        /**
         returns a view presenting the elements of the collection in reverse order.
         */
        let word = "Backwards"
        for char in word.reversed() {
            print(char)
        }
        let reversedWord = String(word.reversed())
        print(reversedWord)
        
        
        //MARK:var underestimatedCount: Int { get }:
        /**
         returns a value less than or equal to the number of elements in the sequence, nondestructively.
         其实就是返回一个集合中相同元素的个数
         */
        print("measuremetns2.underestimatedCount is \(measuremetns2.underestimatedCount)")
        
        
        //MARK:func forEach(_ body: (Element) throws -> Void) rethrows:
        /**
         calls the given closure on each element in the sequence in the same order as a 'for' - 'in' loop.
         */
        
        let numberWords = ["one", "two", "three"]
        for word in numberWords {
            print(word)
        }
        
        numberWords.forEach { word in
            print(word)
        }
        
        
        //MARK:func first(where predicate: (Element) throws -> Bool) rethrows -> Element?
        /**
         returns the first element of the sequence that satisfies the given predicate
         */
        let num13 = [3, 7, 4, -2, 9, -6, 10, 1]
        if let firstNegative = num13.first(where: { $0 < 0 }) {
            print("the first negative number is \(firstNegative)")
        }
        
        //MARK:func dropFirst() -> ArraySlice<Element>:
        /**
         returns a subsequence containing all but the first element of the sequence.
         */
        let num14 = [1, 2, 3, 4, 5]
        print("num14.dropFirst() is \(num14.dropFirst())")
        
        /**
         func dropLast() -> ArraySlice<Element>
         returns a subsequence containing all but the last element of the sequence
         */
        print("num14.dropLast() is \(num14.dropLast())")
        
        
        //MARK:func enumerated() -> EnumeratedSequence<Array<Element>>
        /**
         returns a sequence of pairs (*n*, *x*), where *n* represents a consecutive integer starting at zero and *x* represent an element of the sequence
         */
        for (n, c) in "Swift".enumerated() {
            print("(n,c) is \(n):\(c)")
        }
        
        let names: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolas"]
        var shorterIndices: [SetIndex<String>] = []
        for (i, name) in zip(names.indices, names) {
            if name.count <= 5 {
                shorterIndices.append(i)
            }
        }
        print(names.indices)
        
        for i in shorterIndices {
            print(names[i])
        }
        
        
        //MARK:func min(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?
        /**
         returns the minimum element in the sequence, using the given preficate as the comparison between elements
         */
        let hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
        let leastHue = hues.min { a, b in
            a.value < b.value
        }
        print("leastHue is \(leastHue!)")
        
        
        //MARK:func max(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element?
        /**
         returns the maximum element in the sequence , using the given predicate as the comparison between element.
         */
        let greatestHue = hues.max { (a, b) -> Bool in
            a.value < b.value
        }
        print("greatestHue is \(greatestHue!)")
        
        
        //MARK:func starts<PossiblePrefix>(with possiblePrefix: PossiblePrefix, by areEquivalent: (Element, Element) throws -> Bool) rethrows -> where PossiblePrefix: Sequence, Element == PossiblePrefix.Element
        /**
         returns a Boolean value indicating whether the initial elements of the sequence are equivalent to the elements in another sequence, using the given predicate as the equivalence test.
         */
        let head = ["1", "3", "4", "5"]
        let foot = ["1", "3", "4"]
        
        let result = head.starts(with: foot) { $0 == $1 }
        print("head compare foot is \(result)")
        
        let anotherResult = foot.starts(with: head, by: { $0 == $1 })
        print("foot compare head is \(anotherResult)")
        
        
        //MARK:func elementEqual<OtherSequence>(_ other: OtherSequence, by areEquivalent: (Element, OtherSequence.Element) throws -> Bool) rethrows -> Bool where OtherSequence:Sequence
        
        /**
         returns a Boolean value indicating whether this sequence and another sequence contain equivalent elements in the same order, using the given predicate as the equivalence test.
         */
        let newResult = head.elementsEqual(foot, by: { $0 == $1 })
        print("newResult is \(newResult)")//false
        
        let antherFoot = ["1", "3", "4", "5"]
        
        let newResult1 = head.elementsEqual(antherFoot, by: { $0 == $1 })
        print("newResult1 is \(newResult1)")//true
        
        
        //MARK:func lexicongraphicallyPrecedes<OtherSequence>(_ other: OtherSequence, by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Bool where OtherSequence: Sequence, Element == OtherSequence.Element
        /**
         1. returns a Boolean value indicating whether the sequence precedes another sequence in a lexicographical (dictionary) ordering, using the given predicate to compare elements.
         2. 两个collection 按顺序比较 collection中的 element 大小
         */
        
        let a1 = [1, 3, 3, 4]
        let b1 = [1, 2, 3, 4]
        let result1 = a1.lexicographicallyPrecedes(b1, by: { $0 > $1 })
        print("result1 is \(result1)")
        

        //MARK:func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool
        /**
         returns a Boolean value indicating whether the sequence contains an element that satifies the given predicate
         */
        
        enum HTTPResponse1 {
            case ok
            case error(Int)
        }
        
        let lastThreeResponses: [HTTPResponse1] = [.ok, .ok, .error(404)]
        let hadError = lastThreeResponses.contains { (element) -> Bool in
            if case .error = element {
                return true
            } else {
                return false
            }
        }
        print("hadError is \(hadError)")
        
        let expenses = [21.37, 55.21, 9.32, 10.18, 388.17, 11.41]
        let hasBigPurchase = expenses.contains { $0 > 100 }
        print("hasBigPurchase is \(hasBigPurchase)")

        
        //MARK:func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
        /**
         returns the result of combining the elements of the sequence using the given closure.
         */
        
        /**
         Parameters:
         initialResult: the value to use as the initial accumulating value.
         nextPartialResult: a closure that combines an accumulating value and an element of the sequence into a new accumulating value, to be used in the next call of the 'nextPartialResult' closure or returned to the caller.
         */
        
        let num15 = [1, 2, 3, 4]
        let numSum = num15.reduce(3, { (x, y) in
            x + y
        })
        print("numSum is \(numSum)")
        
        
        //MARK:func reduce<Rsult>(_ initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> Result) rethrows -> Result
        /**
         returns the result of combning the elements of the sequence using the given closure
         统计一个集合中 每个element出现的次数，并以element为 键 和 element 出现的次数为 值 组成一个键值对，并重新常见一个[key:value]集合
         */
        /**
         Parameters:
         initialResult: the value to use as the initial accumulating value.
         updateAccumulatingResult: A closure that updates the accumulating value with an element of the sequence
         */
        let lettersNew = ["nidaye", "gunduzi", "nidaye", "gunduzi", "gunduzi", "ni", "da", "ye"]
        let letterNewCount = lettersNew.reduce(into: [:]) { (counts, letter) in
            counts[letter, default:0] += 1
        }
        print("letterNewCount is \(letterNewCount)")
        
        
        //MARK:func compactMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]
        /**
         returns an array containing the non-'nil' results of calling the given transformation with each element of this sequence
         返回一个无 nil 类型元素的 collection
         */
        /**
         Parameters:
         transform: a closure that accepts an element of this sequence as its argument and returns an optional value
         Returns: an array of the non-'nil' results of calling 'transform' with each element of the sequence
         */
        
        let possibleNum = ["1", "2", "three", "///4///", "5"]
        let mapped: [Int?] = possibleNum.map { str in Int(str) }
        print("mapped is \(mapped)")
        
        let compactMapped: [Int] = possibleNum.compactMap { (str) -> Int? in
            Int(str)
        }
        
        print("compactMapped is \(compactMapped)")
        
        /**
         In this example , note the difference in the result of using 'map' and 'compactMap' with a transformation that returns an optional 'Int' value.
         */
        
        
        let flatArray = [1, 2, 3, 4, 5]
        
        let stringFlatArray: [String] = flatArray.compactMap { (element) -> String? in
            String(element)
        }
        print(stringFlatArray)
        
        /**
         @available(swift, deprecated: 4.1, remaned: "compactMap(_:), message: "Please use compactMap(_:) for the case where closure returns an optional value "")
         */
        
        
        //MARK:-----------------------------------throws 和 rethrows 的使用方法（配合swift中的高阶函数） -----------------------------------
//        let ns:[Int]
//        ns = num5._map(transform: squareOf)
//        print(ns)

        
//        let num7: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
//        let descendingStudents = num7.sorted(by: >)
//        print(descendingStudents)
//        print(num7.sorted())
        
//        let newDecending = num7.sorted(by: onSort(s1:s2:))
//        print(newDecending)
        
        var num8 = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let newDecending = num8.newSorted(by:onSort(s1:s2:))
        print("自定义的排序方法\(newDecending)")
    }
    
    enum CalculationError:Error {
        case DivideByZero
    }
    
    func squareOf(x: Int) -> Int {
        return x * x
    }
    
    func divideTenBy(x: Int) throws -> Double {
        guard x != 0 else {
            throw CalculationError.DivideByZero
        }
        return 10.0 / Double(x)
    }

    func cacheImagesWithNames(names: [Any]) {
        print(names)
    }
    
    func addTenQuadratic(_ value: [Any]) -> [Any] {
        
        var values = value
        let newCount = values.count + 10
        values.reserveCapacity(newCount)
        for n in values.count..<newCount {
            values.append(n)
        }
        return values
    }
    
    func onSort(s1: String, s2: String) -> Bool{
        return s1 < s2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Array {
    mutating func newSorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element] {
        var sorted = [String]()
        for n in 0..<self.count {
            var temper = self[n]
            for i in n+1..<self.count {
                var next = self[i]
                guard try !areInIncreasingOrder(temper, next) else {
                    continue
                }
                swap(&temper, &next)
                self.swapAt(n, i)
            }
            sorted.append(temper as! String)
        }
        return sorted as! [Element]
    }
}



extension Array {
    func _map<T>(transform: (_ element: Int) throws -> T) rethrows -> [T] {
        var ts = [T]()
        for e in self {
            ts.append(try transform(e as! Int))
        }
        return ts
    }
}
