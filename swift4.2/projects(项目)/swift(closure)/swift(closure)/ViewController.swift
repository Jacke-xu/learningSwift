//
//  ViewController.swift
//  swift(closure)
//
//  Created by 范云飞 on 2018/8/20.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

//MARK:----- 2. @escaping closures:
var comlitionHandler: [() -> Void] = []

class SomeClass {
    var sum: Int = 0
    
    func getSumOf1(array: [Int], handler: @escaping (() -> Void)) {
        //step 2
        comlitionHandler.append(handler)
    }
    
    func doSomething1 () {
        //step 1
        self.getSumOf1(array: [16, 756, 442, 6, 23]) {
            self.sum = 1000
            //step 4, finishing the execution
        }
    }
}

class ViewController: UIViewController {
    
    //MARK:-------- 1. @nonescaping closures:
    /**
     在swift3 以后，默认情况下，闭包参数是无法逃逸的，如果你想实现闭包参数逃逸，必须显式地使用@escaping
     */
    
    /**
     当您将闭包作为函数参数传递时，闭包将使用函数的主体执行并返回编译器。 当执行结束时，传递的闭包超出范围并且在内存中不再存在。
     */
    
    func getSumOf(array: [Int], handler: ((Int) -> Void)) {
        //step 2
        var sum: Int = 0
        for value in array {
            sum += value
        }
        
        //step 3
        handler(sum)
    }
    
    func doSomething() {
        //step 1
        self.getSumOf(array: [16, 756, 442, 6, 23]) { (sum) in
            print("doSomething() is \(sum)")
            //step 4, finishing the execution
        }
    }

    
    //MARK:----- 2. @escaping closures:
    
    //FIXME:当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸
    /**
     一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中,但是这个闭包在函数返回之后才被执行。 比如上面的SomeClass 类型
     */
    
//    var comlitionHandler: [(Int) -> Void] = []
//    func getSumOf1(array: [Int], handler: @escaping ((Int) -> Void)) {
//        //step 2
//
//        var sum: Int = 0
//        for value in array {
//            sum += value
//        }
//
//        //step 3
//        self.comlitionHandler.append(handler)
//    }
    
//    func doSomething1 () {
//        //step 1
//        self.getSumOf1(array: [16, 756, 442, 6, 23]) { (sum) in
//            print("doSomething1 is \(sum)")
//            //step 4, finishing the execution
//
//        }
//    }
//
//    class SomeClass {
//
//        func getSumOf1(array: [Int], handler: @escaping ((Int) -> Void)) {
//            //step 2
//
//            var sum: Int = 0
//            for value in array {
//                sum += value
//            }
//
//            //step 3
//            comlitionHandler.append(handler)
//        }
//
//        func doSomething1 () {
//            //step 1
//            self.getSumOf1(array: [16, 756, 442, 6, 23]) { (sum) in
//                print("doSomething1 is \(sum)")
//                //step 4, finishing the execution
//
//            }
//        }
//    }

    
    
    //MARK:------- 3 异步执行
    /**
     当您在发送队列上异步执行闭包时，队列将为您保留内存中的闭包，以便将来使用。在这种情况下，您不知道何时将执行闭包
     */
    func getSumOf2(array: [Int], handler: @escaping ((Int) -> Void)) {
        //step 2
        var sum: Int = 0
        for value in array {
            sum += value
        }
        
        //step 3
        let addtionalTime : DispatchTimeInterval = .seconds(3)
        let delayQueue = DispatchQueue(label: "com.appcode.delayqueue")
        delayQueue.asyncAfter(deadline: .now() + addtionalTime) {
            handler(sum)
        }
    }
    
    func doSomething2() {
        //step 1
        self.getSumOf2(array: [16, 756, 442, 6, 23]) { (sum) in
            print("doSomething2() is \(sum)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:-------- 1. @nonescaping closures
        doSomething()
        
        
        //MARK:-------- 2. @escaping closures(被存储在定义于函数外的变量里)
        let subclass = SomeClass.init()
        subclass.doSomething1()
        print("subclass.sum is \(subclass.sum)")
        
        comlitionHandler.first?()
        print("subclass.sum is \(subclass.sum) now")
        
        
        //MARK:-------- 3. @escaping closures(异步执行)
        
        doSomething2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

