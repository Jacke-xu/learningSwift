//
//  ViewController.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/15.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
//MARK:-------------------------- 自定义操作符 -------------------------------
//MARK:1. 中置运算符
/* 定义优先级组 （不是必须的） */
precedencegroup MyPrecedence {
//    higherThan: AdditionPrecedence // 优先级：比加法运算搞
    lowerThan: AdditionPrecedence //优先级：比加法运算低
    associativity: none           // 结合方法：left, right or none
    assignment: false             // true = 赋值运算符，false = 非赋值运算符
}

infix operator +++ : MyPrecedence // 继承MyPrecedence 优先级组
//infix operator +++: AddtionPrecedence //也可以直接继承加法优先级组或其他优先级组

public func +++ (left: Int, right: Int) -> Int {
    return left + right * 2
}

//MARK:2. 前置运算符
/* 前置运算符是不继承优先级组的 */
prefix operator ==+
public prefix func ==+ (left: Int) -> Int {
    return left * 2
}

//MARK:3. 后置运算符
/* 后置运算符是不继承优先级组的 */
postfix operator +==
public postfix func +== (right: Int) -> Int {
    return right * 3
}


//MARK:------------------------ 使用 typealias 合并协议 ---------------------------
/* 协议，使用关联类型 */
protocol TableViewCell {
    associatedtype T
    func updateCell(_ data: T)
}


protocol changeName {
    func changeNameTo(name: String)
}
protocol changeSex {
    func changeSexTo (sex: Bool)
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:----------------------------------------- swift 词汇结构 ----------------------------------------------
        
        //MARK:--------------------------- 在声明中使用的关键字 ---------------------------
        //MARK:-------------- 1. associatedtype
        /**
         定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名，其代表的实际类型在协议被采纳时才会被指定。可以通过associatedtype 关键字来置顶关联对象。比如说：使用协议声明更新cell的方法
         */
        
        /* 模型 */
        struct Model {
            let age: Int
        }
        
        /* 遵守TableViewCell */
        class MyTableViewCell: UITableViewCell, TableViewCell {
            typealias T = Model
            func updateCell(_ data: Model) {
                //do something ...
            }
        }
        
        
        //MARK:-------------- 2. typealias
        /**
         typealias 使用来为已经存在的类型重新定义名字的，通过命名，可以使代码变得更加的清晰。使用的语法也很简单，使用typealias 关键字像使用普通的赋值语句一样，可以将某个已经存在的类型赋值为新的名字
         */
        
        //MARK:----- 2.1 重新定义闭包类型
        typealias DownSuccess = (_ json: URLResponse, _ filePath: String?) -> ()
        
        //MARK:----- 2.2 protocal 组合
        typealias changeProtocol = changeName & changeSex
        
        struct Persion: changeProtocol {
            func changeNameTo(name: String) {
                print("改变名字")
            }
            
            func changeSexTo(sex: Bool) {
                print("改变性别")
            }
        }
        
        //MARK:----- 2.3 基本类型（应用很广泛）
        
        /**
         public typealias AnyClass = AnyObject.Type
         public typealias NSInteger = Int
         */
        
        //MARK:自定义类型
        /**
         在实际项目过程中，如果有OC和swift 混编的情况，不免要对OC进行swift化，重构的替换工作非常耗时，可以利用 typealias规避这个问题
         */
        /**
         OC中项目里有个类
         #import "OCClass.h"
         
         swift 重构之后
         import SwiftClass
         
         
         typealias OCClass = SwiftClass
         */
        
        //MARK:-------------- 3. class
        
        //MARK:----- 3.1 当前class 为基类
        /**
         当前class为基类，所有属性都有默认值时，可以有类的初始化方法，也可以不实现类的初始化方法。
         */
        class NewPerson {
            var name: String?
            var age: Int = 0
        }
        
        /* 当不指定默认值时，类型必须实现指定构造方法（designed） */
        class NewPerson1 {
            var name: String
            var age: Int
            init() {
                name = ""
                age = 0
            }
        }
        
        //MARK:----- 3.2 当class有父类时，指定构造器（designed）必须调用其父类的指定构造器（designed）
        class NewPerson2: NewPerson1 {
            init(name: String) {
                super.init()
                self.name = name
                self.age = 0
            }
        }
        
        /* 子类也可以复写父类的 designed 构造方法，但是调用父类的designed的方法之前，必须要初始化子类所有属性的值 */
        class NewPerson3: NewPerson1 {
            override init() {
                super.init()
                self.name = ""
                self.age = 0
            }
        }
        
        //MARK:----- 3.3 当子类有convenience构造方法时， convenience构造方法必须要调用designed构造方法
        
        class NewPerson4: NewPerson1 {

            init(name: String, age: Int) {
                super.init()
                self.name = name
                self.age = age

            }
            
            convenience init(name: String) {
                self.init(name: name, age: 0)
            }
            
            convenience init(age: Int) {
                self.init(name: "nidayede", age: age)
            }
        }
        /**
         1. 初始化路径必须保证对象完全初始化，这可以通过调用本类型的designated初始化方法来得到保证
         2. 子类的designated初始化方法必须调用父类的designated方法，以保证父类也完成初始化
         3. convenience初始化方法都必须调用同一个类中的designated初始化完成设置
         4. convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
         */
        
        //FIXME:1. 每个class 保证至少有一个初始化方法， 可以是默认的，也可以是designed 的
        //FIXME:2. 保证初始化完成后， 每个property 有一个初始值，无论是定义时声明的，还是初始化时赋值的
        //FIXME:3. 如果class有继承关系，当子类class 不实现构造方法时，子类将自动从父类class继承初始化方法
        //FIXME:4. 当class的所有属性，在定义时显示或隐式的给出了赋值，那么当不谢当前类的初始化方，编译器会为该类生成默认的初始化方法。如果，属性定义时部分未给出默认值，也不是先类的构造方法，则编译报错
        
        
        //MARK:-------------- 4. subscript
        /**
         在swift中， class， structures ，enum 都可以定义subscript, subscript可以帮助我们更方便的访问或者设置一个集合中的某个成员
         */
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    print("newValue is \(newValue)")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        
        
        //MARK:-------------- 5. inout
        /**
         当我们需要通过一个函数来改变函数外面变量的值（以引用方式传递）时， 可以使用inout关键字来修饰。
         */
        var test1: CGFloat = 50
        func addTestMethod(test2: inout CGFloat, test3: CGFloat = 10) {
            test2 += test3
        }
        
        func testMethod () {
            print("test1 is \(test1)")
            addTestMethod(test2: &test1)
            print("test1 is \(test1) now ")
        }
        
        testMethod()
        
        
        //MARK:-------------- 6. operator/infix/postfix/precedence/associativity
        /**
         与Objective-C 不同 ，swift 支持覆盖或创建运算符。最简单的用例应该是重新定义一些计算符。
         */
        //FIXME:当重新定义新的运算符或者覆盖已有的运算符时，需要用operator 关键字声明
        /**
         操作符类型：
         1. 中置运算符（infix operator）
         2. 前置运算符（prefix operator）
         3. 后置运算符（postfix operator）
         */
        //MARK:----- 6.1 infix operator 使用的例子
        let infixOperatorResult = 2 +++ 3
        print("infixOperatorResult is \(infixOperatorResult)")
        
        //MARK:----- 6.2 prefix operator 使用例子
        let prefixOperatorResult = ==+2
        print("prefixOperatorResult is \(prefixOperatorResult)")
        
        //MARK:----- 6.3 postfix operator 使用例子
        let postfixOperatorResult = 2+==
        print("postfixOperatorResult is \(postfixOperatorResult)")
        
        
        //MARK:--------------------------- 在语句中使用的关键字 ---------------------------
        //MARK:--------------------------- 在表达式和类型使用的关键字 ---------------------------
        //MARK:--------------------------- 模式中使用的关键字 ---------------------------
        //MARK:--------------------------- 以数字符号#开头的关键字 ---------------------------
        //MARK:--------------------------- 在特定上下文中被保留的关键字 ---------------------------
        
        //MARK:-------------- 1. convenience
        
        /**
         1. convenience初始化方法都必须调用同一个类中的designated初始化完成设置
         2. convenience的初始化方法是不能被子类重写或从子类中以super的方式被调用的
         */
        
        //FIXME:只要在子类中实现重写了父类convenience方法所需要的init方法的话，我们在子类中就也可以使用父类的convenience初始化方法了
        class ClassA {
            let numA: Int
            init(num: Int) {
                numA = num
            }
            convenience init(bigNum: Bool) {
                self.init(num: bigNum ? 10000 : 1)
            }
        }
        class ClassB: ClassA {
            let numB: Int
            override init(num: Int) {
                numB = num + 1
                super.init(num: num)
            }
        }
        
        let anObj = ClassB(bigNum: true)
        print("anObj.numA is \(anObj.numA), anObj.numB is \(anObj.numB)")
        
        
        //FIXME:以下标记被当做保留符号，不能用于自定义操作符
        /**
         ( 、 ) 、 { 、 } 、 [ 、 ] 、 . 、 , 、 : 、 ; 、 = 、 @ 、 # 、 & （作为前缀操作符）、 -> 、 `  、 ? 和 ! (作为后缀操作符)
         */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

