//
//  main.swift
//  swift4.2(闭包)
//
//  Created by 范云飞 on 2018/7/24.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:------------------------------------ 闭包 -----------------------------------

/**
 1. 闭包是可以在你的代码中被传递和引用的功能性独立模块。swift中的闭包和C 以及 Objective-C 中的 blocks 很想，还有其他语言中的匿名函数也类似
 2. 闭包能够捕获和存储定义在其上下文中的任何常量和变量的引用，这也就是所谓的闭合并包裹那些常量和变量，因此被称为 “闭包”，swift能为你处理所有关于捕获的内存管理的操作
 3. 闭包复合如下三种形式中的一种：
   * 全局函数是一个有名字但捕获捕获任何值的闭包
   * 内嵌函数是一个有名字且能从其上层函数捕获值的闭包
   * 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包
 4. 常见的优化方法：
   * 利用上下文推断形式参数和返回值的类型
   * 单表达式的闭包可以隐式返回
   * 简写实际参数名
   * 尾随闭包语法
 */



//MARK:------------------------ 1 闭包表达式

/**
 闭包表达式：是一种在简短行内就能写完闭包的语法。闭包表达式为了缩减书写长度又不失易明晰而提供了一系列的语法优化。下边的闭包表达式例子通过使用几次迭代展示 sorted(by:) 方法的精简来展示这些优化，每一次都让相同的功能性更加简明扼要
 */


//MARK:1.1 Sorted 方法

/**
 swift 的标准库提供了一个叫做 sorted(by:) 的方法，会根据你提供的排序闭包将一直类型的数组的值进行排序。一旦他排序完成， sorted(by:)方法会返回与原数组类型大小完全相同的一个新数组，该数组的元素是已排序好的。原始数组不会被 sorted(by:) 方法修改
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)


//MARK:1.2 闭包表达式语法

/* 闭包表达式语法有如下的一般形式： */
/**
 {
    (parameters) -> (return type) in
 
    statements
 }
 */

/**
 1. 闭包表达式语法能够使用常量形式参数、变量形式参数、输入输出形式参数（但不能提供默认值）、可变形式参数（但需要在形式参数列表的最后面使用）、元组（可被用来作为形式参数和返回值）
 */

/* backward(_:_:) 函数的闭包表达版本 */
reversedNames = names.sorted(by:{(s1: String, s2: String) -> Bool in
    return s1 > s2
})

print(reversedNames)

/**
 2. 需要注意的是行内闭包的形式参数类型和返回类型的声明 与 backwards(_:_:) 函数的申明相同。在这两个方式中，都书写成 (s1: String, s2: String) -> Bool。总之对于行内闭包表达式来说，形式参数和返回类型都应写在花括号内而不是花括号外面
 3. 闭包的函数整体部分由关键字 in 导入，这个关键字表示 闭包的形式参数类型和返回类型定义已经完成，并且闭包的函数体即将开始。其实上面的代码只用一行来书写：
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })


//MARK:1.3 从语境中推断类型

/**
 因排序闭包为实际参数来传递给函数，故 swift 能推断它的形式参数类型和返回类型。sorted(by:) 方法期望它的第二个形式参数是一个 (String, String) -> Bool 类型的函数。这意味着 (String， String) 和 Bool类型不需要被携程闭包表达式定义中的一部分，因为所有的类型都能被推断，返回箭头（->）和围绕在形式参数名周围的括号也能被省略
 */

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print(reversedNames)

//FIXME:当把闭包作为行内闭包表达式传递给函数，形式参数类型和返回类型都可以被推断出来。所以说，当闭包被用作函数的实际参数时，你都不需要用完整格式来书写行内闭包。然而，如果你希望的话仍然可以明确类型，并且在读者阅读你的代码时如果他能避免可能存在的歧义的话还是值得的。


//MARK:1.4 从单表达式闭包隐式返回

/**
 单表达式闭包能够通过从它们的声明中删除掉 return 关键字来隐式返回它们单个表达式的结果
 */

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames)


//MARK:1.5 简写的实际参数名

/**
 1. swift 自动对行内闭包提供简写实际参数名，你也可以通过$0, $1, $2 等名字来引用闭包的实际参数值
 2。 如果你在闭包表达式中使用这些简写实际参数名，那么你可以在闭包的实际参数列表中忽略对其的定义，并且简写实际参数名的数字和类型将会从期望的函数类型中推断出来。 in 关键字也能被省略，因为闭包表达式完全由他的函数体组成：
 */

reversedNames = names.sorted(by: { $0 > $1 }) /* 这里，$0 和 $1 分别是闭包的第一个和第二个 String 实际参数 */


//MARK:1.6 运算符函数

/**
 除了以上的写法，还有一种更简短的方式来撰写上述闭包表达式。 swift 的 String 类型定义了关于大于号 （>）的特定字符串实现， 让其作为一个有两个 String 类型形式参数函数并返回一个 Bool 类型的值。这正好与 sorted(by:) 方法的第二个形式参数需要的函数相匹配。因此，你能简单地传递一个大于号，并且swift 将推断你想使用大于号特殊字符串函数实现
 */

reversedNames = names.sorted(by: >)
print(reversedNames)



//MARK:------------------------ 2 尾随闭包

/**
 如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数括号外面（后面）的闭包表达式：
 */

func someFunctionThatTakesAClosure(closure:() -> Void) {
    //function body goes here
}

someFunctionThatTakesAClosure {
    //closure's body goes here
}

someFunctionThatTakesAClosure(){
    //trailing closure's body goes here
}

//FIXME:如果闭包表达式被用作函数唯一的实际参数并且你把闭包表达式用作尾随闭包，那么调用这个函数的时候你就不需要在函数的名字后面写一对圆括号（），如下面的例子：

reversedNames = names.sorted { $0 > $1 }
print(reversedNames)

/**
 上面的例子中，特别是当闭包很长以至于不能被写成一行时，尾随闭包就显得非常有用了。
 */

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nice"]

let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}

print(strings)



//MARK:------------------------ 3 捕获值

/**
 1.一个闭包能够从上下文捕获已被定义的常量和变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍能够在其函数体内引用和修改这些值
 2. 在swift 中， 一个能够捕获值的闭包最简单的模型就是内嵌函数。一个内嵌函数能够捕获外部函数的实际参数并且能够捕获任何在外部函数的内部定义了的常量和变量
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

/**
 incrementer() 函数是没有任何形式参数，runningTotal 和 amount 不是来自函数体的内部，而是通过捕获主函数的 runningTotal 和 amount 把它们内嵌在自身函数内部供使用。当调用 makeIncrementer 结束时通过引用捕获来确保不会消失，并确保了在下次再调用 incrementer时， runningTotal 将继续增加
 */

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())


let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())

//FIXME:如果你分配了一个闭包给类实例的属性，并且闭包通过引用该实例或者他的成员来捕获实例，你将在闭包和实例间建立一个强引用环， swift将使用捕获列表来打破这种强引用环



//MARK:------------------------ 4 闭包是引用类型

/**
 在上面例子中， incrementBySeven 和 incrementByTen 是常量，但是这些常量只想的闭包仍可以增加已捕获的变量 runningTotal 的值。这是应为函数和闭包都是引用类型。
 */

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())



//MARK:------------------------ 5 逃逸闭包

/**
 1.当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数是，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的
 2. 闭包可以逃逸的一种方法是被存储在定义于函数外的变量里。比如说，很多函数接收闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成-------闭包需要逃逸
 */

var complitionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(complitionHandler: @escaping () -> Void) {
    complitionHandlers.append(complitionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

complitionHandlers.first?()
print(instance.x)



//MARK:------------------------ 6 自动闭包

/**
 自动闭包是一种自动创建的用来把作为实际参数传递给函数表达式打包的闭包。它不接受任何实际参数，并且当他被调用时，他会返回内部打包的表达式的值。自动闭包允许你延迟处理，因此闭包内部的代码直到你调用它的时候才会运行。
 */

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

/**
 尽管 customersInline 数组的第一个元素以闭包的一部分被移除了，但任务并没有执行直到闭包被实际调用。如果闭包永远不被调用，那么闭包里边的表达式就永远不会求值。注意 customerProvider 的类型 不是 String 而是 () -> String ———————— 一个不接受实际参数并且返回一个字符串的函数
 */


/* 当你传一个闭包作为实际参数到函数的时候，你会得到与延迟处理相同的行为 */
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) })
print(customersInLine.count)


/**
 上面的函数 serve(customer:) 接受一个明确的返回下一客户名称的闭包。下边的另一个版本的serve(customer:)执行相同的任务但是不适用明确的闭包而是通过 @autoclosure 标志标记它的形式参数使用了自动闭包。
 */


func serveN(customer customerProvider: @autoclosure () -> String ) {
    print("Now serving \(customerProvider())!")
}

serveN(customer: customersInLine.remove(at: 0))
print(customersInLine.count)



//FIXME:滥用自动闭包会导致你的代码难以读懂。上下文和函数名应该写清除求值是延迟的

/**
 如果你想要自动闭包允许逃逸，就同时使用 @autoclosure 和 @escaping 标志
 */
var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))
print("Collected \(customerProviders.count) closures")

print(customersInLine)

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

//FIXME:闭包其实和 block回调是类似的：异步执行
