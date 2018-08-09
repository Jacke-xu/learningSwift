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
        
        //MARK:public init()
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
        
        
        //MARK:public init(minimumCapacity: Int)
        /**
         \~chinese
         创建一个 至少大于等于给定长度的 Dictionary 对象
         
         \~english:
         creates a dictionary with at least the given number of elements worth of buffer
         */
        var dict4 = [String: AnyObject].init(minimumCapacity: 2)
        dict4 = ["one": 1, "two": "seconde", "third": ["key": 2]] as [String : AnyObject]
        print("dict4 is \(dict4)")
        
        
        //MARK:public init<S>(uniqueKeysWithValues keysAndValues: S) where S : Sequence, S.Element == (Key, Value)
        /**
         \~chinese:
         创建一个新的dictionary 根据给定的一个 dictionary序列
         
         \~english:
         creates a new dictionary from the key-value pairs in the given sequence
         */
        
        let digitWords = ["one", "two", "three", "four", "five"]
        let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))
        print("wordToValue is \(wordToValue)")
        
        
        //MARK:public init<S>(_ keysAndValues: S, uniquingKeysWith combine: (Dictionary.Value, Dictionary.Value) throws -> Dictionary.Value) rethrows where S : sequence, S.Element == (key, Value)
        
        /**
         \~chinese:
         创建一个新的 dictionary 根据给定的 序列中的键值对，使用组合闭包来确定任何重复键对应的值
         
         \~english:
         creates  a new dictionary from the key-value pairs in the given sequence, using a combining closure to determine the value for any duplicate keys
         */
        let pairsWithDuplicateKeys = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
        let firstValues = Dictionary(pairsWithDuplicateKeys, uniquingKeysWith: { (first11, _) in first11 })
        print("firstValues is \(firstValues)")
        
        let lastValues = Dictionary.init(pairsWithDuplicateKeys, uniquingKeysWith: { (_, first) in first })
        print("lastValues is \(lastValues)")
        
        //MARK:--------------------------- Extension Dictionary --------------------
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

