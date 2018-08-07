//
//  ViewController.swift
//  swift中的高阶函数（throw 和 rethrows的用法）
//
//  Created by 范云飞 on 2018/8/7.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK:-------------------- swift中高阶函数、throws、rethrows的用法------------------------
        
        let num5 = [10, 20, 30, 40, 50]
        let ns:[Int]
        do {
            try! ns = num5._map(transform: squareOf)
            print(ns)
        } catch  {
            
        }
        
        
        let num7: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
        let descendingStudents = num7.sorted(by: >)
        print(descendingStudents)
        
//        print(num7.sorted())
//
//        let newDecending = num7.sorted(by: onSort(s1:s2:))
//        print(newDecending)
//
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

