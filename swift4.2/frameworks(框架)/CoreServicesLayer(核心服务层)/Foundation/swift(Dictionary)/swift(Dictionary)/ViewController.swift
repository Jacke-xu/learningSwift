//
//  ViewController.swift
//  swift(Dictionary)
//
//  Created by 范云飞 on 2018/8/8.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dic = Dictionary<String, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:--------------------------- Dictionary ------------------------------
        
        //MARK:init(): Dictionary 的定义和声明
        /**
         \~chinese
         创建一个 Dictionary 对象
         
         \~english:
         creates an dictionary
         */
        
        
        /*\chinese: 定义一个可变字典  \english: creates an variable dictionary */
        var dic1 = [String: Any].init()
        print("dic1 is \(dic1)")
        
        /*\chinese: 定义一个不可变的字典  \english: creates an immutable dictioanry */
        let dic2 = ["name": "why", "age": 18] as [String : Any]
        print("dic2 is \(dic2)")
        
        /*\chinese: 声明一个字典  \english: declare an Dictionary */
        var dict3: Dictionary<String, Any>//swift 中任意对象，通常不适用NSObject,使用AnyObject
        
        
        //MARK:init(minimumCapacity: Int):
        /**
         \~chinese
         创建一个 至少大于等于给定长度的 Dictionary 对象
         
         \~english:
         creates a dictionary with at least the given number of elements worth of buffer
         */
        var dict4 = [String: AnyObject].init(minimumCapacity: 2)
        dict4 = ["one": 1, "two": "seconde", "third": ["key": 2]] as [String : AnyObject]
        print("dict4 is \(dict4)")
        
        
        //MARK:<#comments#>
        
        
        
        //MARK:--------------------------- Extension Dictionary --------------------
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

