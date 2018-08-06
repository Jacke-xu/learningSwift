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
        
        //MARK:encode the elements of this array into the given encoder in an unkeyed container.
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

