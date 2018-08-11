//
//  ViewController.swift
//  swift(set)
//
//  Created by 范云飞 on 2018/8/10.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var testSet = Set<String>.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:--------------------------- Set --------------------------
        
        //MARK:public init(minimumCapacity: Int)
        
        /**
         \~chinese:
         创建一个新的或者空的 Set， 它的长度大于等于给定的长度
         
         \~english:
         creates a new , empty set with at least the specified number of elements's worth of buffer.
         */
        
        
        //MARK:@available(swift 4.0) public func filter(_ isIncluded: (Set.Element) throws -> Bool) rethrows -> Set<Element>
        
        /**
         \~chinese:
         返回一个新的Set，它包含另一个Set中满足给定条件的元素
         
         \~english:
         returns a new set containing the elements of the set that satisfy the given predicate
         */
        
        let cast: Set = ["Vivien", "Marlon", "Kim", "Karl"]
        let shortNames = cast.filter { $0.count < 5 }
        print("shortNames.isSubset(of:cast) is \(shortNames.isSubset(of: cast))")
        print("shortNames.contain 'Vivien' is \(shortNames.contains("Vivien"))")
        
        
        //MARK: public mutating func subtract(_ other: Set<Set.Element>)
        
        /**
         \~chinese:
         根据给定Set的元素，移除拥有相同元素的另一个Set中的元素
         
         \~english:
         removes the elements of the given set from this set.
         */
        
        var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let neighbors: Set = ["Bethany", "Eric", "Forlant", "Greta"]
        
        employees.subtract(neighbors)
        print("employees is \(employees)")
        print("neighbors is \(neighbors)")
        
        //MARK:public func isSubset(of other: Set<Set.Element>) -> Bool
        /**
         \~chinese:
         判断一个Set 是否是 另个一Set 的子集
         
         \~english:
         returns a Boolean value that indicates whether this set is a subset of the given set.
         */
        
        let employees2: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let attendees: Set = ["Alicia", "Bethany", "Diana"]
        print("attendees.isSubset(of: employees) is \(attendees.isSubset(of: employees2))")
        
        //MARK:public func isSuperset(of other: Set<Set.Element>) -> Bool
        /**
         \~chinese:
         判断一个Set 是否是另一个 Set的超集
         
         \~english:
         returns a Boolean value that indicates whether this set is a superset of the given set.
         */
        
        let employees3: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let attendees1: Set = ["Alicia", "Bethany", "Diana"]
        print("employees3.isSuperset(of: attendees1) is \(employees3.isSuperset(of: attendees1))")
        
        
        //MARK:public func isDisjoint(with other: Set<Set.Element>) -> Bool
        /**
         \~chinese:
         返回一个Bool值，确定确定当前的Set与给定的Set相比是否有相同的元素
         
         \~english:
         returns a Boolean value that indicates whether this set has no members in common with the given set.
         */
        
        let employees1: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let visitors: Set = ["Marica", "Nathniel", "Olivia"]
        print("employees.isDisjoint(with:visitors) is \(employees1.isDisjoint(with:visitors))")
        
        
        //MARK:public func subtracting(_ other: Set<Set.Element>) -> Set<Set.Element>
        /**
         \~chinese:
         返回一个新的 Set，包含的是当前的Set除去和给定的Set交集后的元素
         
         \~english:
         returns a new set containing the elements of this set that do not occur in the given set.
         */
        
        let employees4: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let neighbors1: Set = ["Bethany", "Eric", "Forlani", "Greta"]
        
        let nonNeighbors = employees4.subtracting(neighbors1)
        print("nonNeighbots is \(nonNeighbors)")
        
        
        //MARK:public func isStrictSuperset(of other: Set<Set.Element>) -> Bool
        
        /**
         \~chinese:
         判断一个Set 是否是另个给定的Set的严格的超集
         
         \~english:
         returns a Boolean value that indicates whether the set is a strict superset of the given sequence.
         */
        let employees5: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let attendees2: Set = ["Alicia", "Bethany", "Diana"]
        print("employees5.isStrictSuperset(of: attendees) is \(employees5.isStrictSuperset(of: attendees2))")
        
        
        //MARK:public func isStrictSubset(of other: Set<Set.Element>) -> Bool
        /**
         \~chinese:
         判断一个Set 是否是另一个 Set 的严格的子集
         
         \~english:
         returns a Boolean value that indicates whether the set is a strict subset of the given sequence.
         */
        
        //MARK:public func intersection(_ other: Set<Set.Element>) -> Set<Set.Element>
        /**
         \~chinese:
         返回两个Set 的交集
         
         \~english:
         returns a new set with the elements that are common to both this set and the given sequence
         */
        
        
        //MARK:public mutating func formSymmetricDifference(_ other: Set<Set.Element>)
        /**
         \~chinese:
         返回两个Set 中除去交集外的所有元素
         
         \~english:
         removes the element of the set that are also in the given sequence and  adds the memeber of the sequence that not already in the set
         */
        
        var employees6: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
        let neighbors3: Set = ["Bethany", "Eric", "Forlani", "Greta"]
        print("employees6.formsymmetricDifference(neighbors3) is \(employees6.formSymmetricDifference(neighbors3))")
        
        
        //MARK:public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
        /**
         \~chinese:
         返回一个array， 它包含当前序列中被给定闭包处理过的元素
         
         \~english:
         returns an array containing the results of mapping the given closure over the sequence's element.
         */
        
        let cast1: Set = ["Vivien", "Marlon", "Kim", "Karl"]
        let lowercaseNames = cast1.map { $0.lowercased() }
        print("lowercaseNames is \(lowercaseNames)")
        
        let letterCounts = cast1.map { $0.count }
        print("letterCounts is \(letterCounts)")
        
        
        //MARK:public func dropFirst(_ n: Int) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含去除给定的index之前的元素
         
         \~english:
         returns a subsequence containing all but the given number of initial elements
         */
        
        let numbers = [1, 2, 3, 4]
        print("number.dropFirst(2) is \(numbers.dropFirst(2))")
        
        /*
         \chinese:
         如果给定的index 超过序列的count， 就返回[]
         
         \english:
         if the number of elements to drop exceeds the number of elements in the collection, the result is an empty subsequence
         */
        print("number.dropFirst(10) is \(numbers.dropFirst(10))")
        
        
        //MARK:public func dropLast(_ n: Int) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含去除给定index之后的所有元素
         
         \~english:
         returns a subsequence containing all but the specified number of final elements.
         */
        let numbers1 = [1, 2, 3, 4, 5]
        print("number1.dropLast(2) is \(numbers1.dropLast(2))")
        
        /**
         \~chinese:
         如果给定的index 超过序列的count就返回 []
         
         \~english:
         if the number of elements to drop exceeds the number of elements in the collection, the result is an empty subsequence.
         */
        
        
        //MARK:public func prefix(_ maxLength: Int) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含给定index之前的所有的元素
         
         \~english:
         returns a subsequence, up to the specified maximum length, containing the initial element of the collection.
         */
        
        let numbers3 = [1, 2, 3, 4, 5]
        print("numbers3 is \(numbers3)")
        
        /**
         \~chinese:
         如果给定的index超过了序列的count，将返回原来序列的所有元素
         
         \~english:
         if the maximum length exceeds the number of elements in the collection, the result contains all the elements in the collection.
         */
        print("numbers3 is \(numbers3)")
        
        //MARK:public func suffix(_ maxLenght: Int) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含给定index之后的所有元素
         
         \~english:
         returns a subsequence, up to the given maximum length, containing the final element of the collection.
         */
        
        let numbers4 = [1, 2, 3, 4, 5]
        print("numbers.suffix(2) is \(numbers4.suffix(2))")
        
        /**
         \~chinese:
         如果给定的index 超过了序列的count，则返回整个序列
         
         \~english:
         if the maximum length exceeds the number of elements in the collection, the result contains all the elements in the collection.
         */
        
        print("numbers4.suffix(10) is \(numbers4.suffix(10))")
        
        
        //MARK:public func prefix(upTo end: Set<Element>.Index) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含从当前序列的startIndex开始到给定的index 的元素，但是不包括给定的Index位置的元素
         
         \~english:
         returns a subsequence from the start of the collection up to, but not including, the specified position.
         */
        
        let numbers5 = [10, 20, 30, 40, 50, 60]
        if let i = numbers5.index(of: 40) {
            print("numbers5.prefix(upTo:i) is \(numbers5.prefix(upTo: i))")
        }
        
        //MARK:public func suffix(from start: Set<Element.Index>) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含从给定的index位置开始一直到最后一个元素
         
         \~english:
         returns a subsequence from the specified position to the end of the collection.
         */
        
        let numbers6 = [10, 20, 30, 40, 50, 60]
        if let i = numbers6.index(of: 40) {
            print("numbers6.suffix(from:i) is \(numbers6.suffix(from: i))")
        }
        
        
        //MARK:public func prefix(through position: Set<Element>.Index) -> Slice<Set<Element>>
        /**
         \~chinese:
         返回一个序列，它包含从当前序列的第一个元素开始到给定的index位置的元素
         
         \~english:
         returns a subsequence from the start of the collection through the specified position
         */
        let numbers7 = [10, 20, 30, 40, 50, 60]
        if let i = numbers7.index(of: 40) {
            print("numbers7.prefix(through:i) is \(numbers7.prefix(through: i))")
        }
        
        
        //MARK:public func split(maxSplits: Int = default, omittingEmptySubsequences: Bool = default, whereSeparator isSeparator: (Element) throws -> Bool) rethrows -> [Slice<Set<Element>>]
        
        /**
         \~chinese:
         返回当前collection中尽可能长的子序列集，这些序列中不包含满足给定条件的元素
         
         \~english:
         returns the longest possible subsequences of the collection, in order, that don't contain element satisfying the given predicate.
         */
        
        let line = "BLANCHE:   I don't want realism. I want magic!"
        print("line.split(whereSeparator: { $0 == ", " }) is \(line.split(whereSeparator: { $0 == " " }))")
        
        print("line.split(maxSplits: 1, whereSeparator: { $0 == " ,"}) is \(line.split(maxSplits: 1, omittingEmptySubsequences: true, whereSeparator: { $0 == " " }))")
        
        
        //MARK:public func index(where predicate: (Element) throws -> Bool) rethrows -> Set<Element>.Index?
        /**
         \~chinese:
         返回一个序列中第一个符合给定条件的元素的index
         
         \~english:
         returns the first index in which an element of the collection safisfies the given predicate
         */
        
        let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        if let i = students.index(where: { $0.hasPrefix("A") }) {
            print("\(students[i]) start with A")
        }
        
        
        //MARK:public func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
        
        /**
         \~chinese:
         返回一个按给定条件进行排序后的序列
         
         \~english:
         returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
         */
        
        let students2 = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let descendingStudents = students2.sorted(by: { $0 > $1 })
        print("descendingStudents is \(descendingStudents)")
        
        
        //MARK:public static func != (lhs: Set<Element>, rhs: Set<Element>) -> Bool
        /**
         \~chinese:
         返回一个Bool值，判断两个value 是否相同
         
         \~english:
         returns a Boolean value indicating whether two values are not equal.
         */
        
        //MARK:public var indices: DefaultIndices<Set<Element>> { get }
        /**
         \~chinese:
         一个序列中有效的下标集，在升序中
         
         \~english:
         the indices that are valid for subscripting the collection, in ascending order.
         */
        var c = [10, 20, 30, 40, 50]
        var i = c.startIndex
        while i != c.endIndex {
            c[i] /= 5
            i = c.index(after: i)
        }
        print("c is \(c) now")
        
        
        
        //MARK:public subscript<R>(r: R) -> Slice<Set<Element>> where R : RangeExpression, Set<Element>.Index == R.Bound { get }
        
        /**
         \~chinese:
         通过一个范围表达式访问序列中特定的连续的范围内的元素
         
         \~english:
         accesses the contiguous subrange of the collection's elements specified by a range expression.
         */
        
        let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        let streetsSlice = streets[2...]
        print("streetsSlice is \(streetsSlice)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

