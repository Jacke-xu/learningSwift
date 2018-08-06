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
        var firstElement = 10
        print(values.formIndex(after: &firstElement))
        print(values.formIndex(after: &firstElement))
        
        
        
        
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

