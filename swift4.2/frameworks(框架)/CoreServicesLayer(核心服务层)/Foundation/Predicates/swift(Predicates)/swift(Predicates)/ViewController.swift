//
//  ViewController.swift
//  swift(Predicates)
//
//  Created by 范云飞 on 2018/10/19.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
//葵つかさ

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //参考资料: https://my.oschina.net/u/2340880/blog/1633537
        
        //MARK:-------------------------- NSExpression ------------------------------
        
        /**
         参考资料: https://nshipster.cn/nsexpression/
                  https://spin.atomicobject.com/2015/03/24/evaluate-string-expressions-ios-objective-c-swift/
         */
        
        /**
         * 用于比较谓词的表达式
         * 表达式是谓词实现的核心。当 expressionValueWithObject: 调用时, 将计算表达式, 并返回一个值, 然后可以由运算符处理。表达式可以是从常量到方法调用的任何内容。应在适当的 NSValue 类中包装标量
         */
        
        //MARK:----- 1. Initializing an Expression (初始化表达式)
        
        //MARK:init(expressionType type: NSExpression.ExpressionType) /使用指定的表达式类型初始化表达式
        
        //定义可能的类型NSExpression
//        public enum ExpressionType : UInt {
//
//
//            case constantValue //始终返回相同值的表达式
//
//            case evaluatedObject //一个总是返回参数对象本身的表达式
//
//            case variable //一个表达式，他始终返回与绑定字典中由“variable”指定的键相关联的任何值
//
//            case keyPath //返回可以用作键路径的表达式的表达式
//
//            case function //一个表达式，返回计算函数的结果
//
//            @available(iOS 3.0, *)
//            case unionSet //一个表达式，用于创建两个嵌套表达式结果的并集
//
//            @available(iOS 3.0, *)
//            case intersectSet //一个表达式，用于创建两个嵌套表达式结果的交集
//
//            @available(iOS 3.0, *)
//            case minusSet //通过set减法组合两个嵌套表达式结果的表达式
//
//            @available(iOS 3.0, *)
//            case subquery //使用subpredicate 过滤集合的表达式
//
//            @available(iOS 3.0, *)
//            case aggregate //定义NSExpression 对象聚合的表达式
//
//            @available(iOS 7.0, *)
//            case anyKey //表示任何键的表达式
//
//            case block 使用块的表达式
//
//            @available(iOS 9.0, *)
//            case conditional
//        }
        
        
        //MARK:init(format expressionFormat: String, argumentArray arguments: [Any]) // 使用指定的表达式格式和参数数组吃石化表达式
        let formatString = "4 + 5 - 2**3"
        let expression01 = NSExpression.init(format: formatString, [NSExpression.init(expressionType: NSExpression.ExpressionType.function)])
        if let value = expression01.expressionValue(with: nil, context: nil) {
            print("---------- expression01.expressionValue(with: nil, context: nil) is \(value)")
        }
        
        
        //MARK:init(format expressionFormat: String, arguments argList: CVaListPointer) // 使用指定的表达式格式和参数列表初始化表达式
        //参考资料： https://boxueio.com/series/interoperate-swift-with-c/ebook/246


        //MARK:----- 2. Creating an Expression for a Value (为值创建表达式)
        //MARK:init(forConstantValue obj: Any?) // 返回表示给定常量值的新表达式
        let constantExpression = NSExpression.init(forConstantValue: "fanyunfei")
        if let constantValue = constantExpression.expressionValue(with: nil, context: nil) {
            print("---------- constantExpression.expressionValue(with: nil, context: nil) is \(constantValue)")
        }

        //MARK:class func expressionForEvaluatedObject() -> NSExpression //返回表示要计算的对象新表达式
        print("---------- NSExpression.expressionForEvaluatedObject() is \(NSExpression.expressionForEvaluatedObject())")
        
        //MARK:init(forKeyPath keyPath: String) //返回使用给定键路径调用的新表达式
        
        //MARK:init(forVariable string: String) //返回一个新表达式，该表达式从给定键的变量绑定字典中i提取值
        
        //MARK:class func expressionForAnyKey() -> NSExpression //返回表示Spotlight查询的任何键的新表达式
        
        //MARK:----- 3. Creating a Collection Expression (创建集合表达式)
        //MARK:init(forAggregate subexpressions: [NSExpression]) //返回给定集合的新聚合表达式
        print("---------- NSExpression.init(forAggregate: [expression01, constantExpression]) is \(NSExpression.init(forAggregate: [expression01, constantExpression]))")
        
        //MARK:init(forUnionSet left: NSExpression, with right: NSExpression) //返回NSExpression 表示给定集合和集合的并集的新对象
        print("---------- NSExpression.init(forUnionSet: expression01, with: constantExpression) is \(NSExpression.init(forUnionSet: expression01, with: constantExpression))")
        
        //MARK:init(forIntersectSet left: NSExpression, with right: NSExpression) //返回NSExpression 表示给定集合和集合的交集的新对象
        print("---------- NSExpression.init(forIntersectSet: expression01, with: constantExpression) is \(NSExpression.init(forIntersectSet: expression01, with: constantExpression))")
        
        //MARK:init(forMinusSet left: NSExpression, with right: NSExpression) //返回一个新NSExpression对象，表示给定集合中给定集合的减法
        print("---------- NSExpression.init(forMinusSet: expression01, with: constantExpression) is \(NSExpression.init(forMinusSet: expression01, with: constantExpression))")
        
        
        //MARK:----- 4. Creating a Subquery (创建子查询)
        //MARK:init(forSubquery expression: NSExpression, usingIteratorVariable variable: String, predicate: NSPredicate)
        /**
         返回一个表达式，该表达式通过将集合中的元素存储在给定变量中并保留限定符返回true的元素来过滤集合
         */
        class Person : NSObject {
            public let name: String
            public let birthYear: Int
            init(name pName: String, birthYear year: Int) {
                name = pName
                birthYear = year
                super.init()
            }
        }
        
        class Parent: Person {
            public var children: [Person] = [Person]()
            override init(name pName: String, birthYear year: Int) {
                super.init(name: pName, birthYear: year)
            }
        }
        
        class TestSubquery {
            public class func getParent() -> Parent {
                let p = Parent(name: "Bob", birthYear: 1997)
                let c = Person(name: "Tonny", birthYear: 2010)
                p.children.append(c)
                return p
            }
        }
        
//        let p = TestSubquery.getParent()
//        print("\(p.children.count)")
//        let e1 = NSExpression.init(forAggregate: [p.children] as! [NSExpression])
//        let predicate = NSPredicate(format: "$x.birthYear > 0")
//        let e2 = NSExpression(forSubquery: e1, usingIteratorVariable: "x", predicate: predicate)
//        let expValue = e2.expressionValue(with: nil, context: nil)
        
        //FIXME:init(forSubquery expression: NSExpression, usingIteratorVariable variable: String, predicate: NSPredicate) 尚未搞明白
        
        //MARK:----- 5. Creating an Expression Using Blocks (使用块创建表达式)
        //MARK:init(block: @escaping (Any?, [NSExpression], NSMutableDictionary?) -> Any, arguments: [NSExpression]?)
        
        let expressionBlocks = NSExpression.init(block: { (<#Any?#>, <#[NSExpression]#>, <#NSMutableDictionary?#>) -> Any in
            <#code#>
        }, arguments: <#T##[NSExpression]?#>)
        
        //MARK:----- 6. Creating an Expression for a Function (为函数创建表达式)
        //MARK:----- 7. Getting Information About an Expression (获取有关表达式的信息)
        //MARK:----- 8. Evaluating an Expression (评估表达式)
        //MARK:----- 9. Accessing the Expression Block (访问表达式块)
        //MARK:----- 10. Constants (常量)
        //MARK:----- 11. Initializers (初始化器)
        //MARK:----- 12. Instance Properties (实例属性)
        
        //MARK:-------------------------- NSComparisonPredicate ---------------------
        
        //MARK:-------------------------- NSCompoundPredicate -----------------------
        
        //MARK:-------------------------- NSPredicate -------------------------------
    }


}

