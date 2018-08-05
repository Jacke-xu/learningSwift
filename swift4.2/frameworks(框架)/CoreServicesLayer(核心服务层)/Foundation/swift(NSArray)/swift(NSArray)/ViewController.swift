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
        print(emptyArray.isEmpty)
        
        emptyArray = []
        print(emptyArray.isEmpty)
        
        let number = Array(1...7)
        print(number)
        
        let namedHues: [String: Int] = ["Vermillion": 18, "Magenta": 302, "Gold": 50, "Cerise": 320]
        let colorNames = Array(namedHues.keys)
        cacheImagesWithNames(names: colorNames)
        let colorValues = Array(namedHues.values)
        cacheImagesWithNames(names: colorValues)
        
        //MARK:init(repeating:count:)
        let fiveZs = Array(repeating: "Z", count: 5)
        print(fiveZs)
        
        //MARK:count && capacity
        var numbers = [10, 20, 30, 40, 50]
        print(numbers.count)
        print(numbers.capacity)
        
        //MARK:reserveCapacity(_:)
        let values = [0, 1, 2, 3]
        print(addTenQuadratic(values))
        
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

