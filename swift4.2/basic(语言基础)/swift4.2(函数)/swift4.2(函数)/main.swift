//
//  main.swift
//  swift4.2(函数)
//
//  Created by 范云飞 on 2018/7/24.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:------------------------------------ 函数 ----------------------------------

/**
 1. 函数是一个独立的代码块，用来执行特定的任务
 2. swift 统一的函数语法十分灵活，从简单的无形式参数的C风格函数到复杂的每一个形式参数都带有局部和外部形式参数名的Objective-C风格方法的任何内容
 3. swift 中的每一个函数都有类型，可以将一个函数当做一个形式参数传递到另外的一个函数中，也可以在一个函数中返回另一个函数。也可以内嵌在其他函数内部
 */



//MARK:-------------------------- 1.定义和调用函数

/**
 1. 定义函数：选择定义一个或者多个命名的分类的值作为函数的输入（所谓的形式参数），当函数需要返回值时需要传回作为输出的值的类型（所谓的返回类型）
 2. 调动函数：通过调用函数的名字并且传入一个或者多个复合函数形式参数类型的输入值（所谓的实际参数）
 */

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain(person: "John"))




//MARK:-------------------------- 2 函数的形式参数和返回值

//MARK:2.1 无形式参数的函数

/**
 函数没有要求必须输入一个参数，这里有一个没有输入形式参数的函数，无论何时他被调用永远会返回相同的String信息
 */

func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())


//MARK:2.2 多形式参数的函数

/**
 函数可以输入多个形式参数，可以写在函数后边的圆括号内，用都好分隔
 */
func newGreet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(newGreet(person: "Tim", alreadyGreeted: true))


//MARK:2.3 无返回值的函数
/**
 函数定义中没有要求必须哟一个返回类型。下面是另一个版本的greet(persion:)函数，它将自己的String 值打印了出来而不是返回他
 */

func greet1(person: String) {
    print("Hello, \(person)!")
}

greet1(person: "Dave")

//FIXME:严格来讲，函数greet1(person:)还是有一个返回值的，尽管没有定义返回值。没有定义返回类型函数实际上会返回一个特殊的类型Void。它其实是一个空的元组，作用相当于没有元素的元组，可以写作()

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

print(printAndCount(string: "Hello, world"))
printWithoutCounting(string: "hello, world")

//FIXME:返回值可以被忽略，但是如果一个函数需要返回值的时候就必须返回。如果一个函数有定义的返回类型，没有返回值的话就不会继续运行到函数的末尾，尝试这么做的话会得到编译时错误


//MARK:2.4 多返回值的函数

/**
 为了让函数返回多个值作为一个复合的返回值，你可以使用元组类型作为返回类型
 */

func minMax(array: [Int]) -> (min: Int, max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


//MARK:2.5 可选元组返回类型

/**
 如果元组在函数的返回类型中有可能 “没有值”，你可以用一个可选元组返回类型来说明整个元组的可能是 nil。 书写：在可选元组类型圆括号后边添加一个问号（？）例如(Int, Int)? 或者(String, Int, Bool)?
 */

//FIXME:类型(Int, Int)?的可选元组类型和包含可选类型的元组 (Int?, Int?)是不同的。对于可选元组类型，整个元组是可选的，而不仅仅是元组里边的单个值

/**
 上面的例子中 并没有对传入的Array进行安全性检查，如果包含了一个空的数组，就会触发运行时错误。此时就需要把minMax(array:)函数的返回类型写作可选元组，当数组是空的时候返回一个nil值：
 */

func minMax1(array: [Int]) -> (min: Int, max:Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}



//MARK:-------------------------- 3 函数实际参数标签和形式参数名

/**
 函数的形式参数包含：实际参数标签和形式参数名。
 1. 实际参数标签用在调动函数的时候
 2. 形式参数名用在函数的实现当中
 默认情况下，形式参数使用它们的形式参数名作为实际参数标签
 */

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}

someFunction(firstParameterName: 1, secondParameterName: 2)


//MARK:3.1 置顶实际参数标签

/**
 在提供形式参数名之前写实际参数标签，用空格分隔：
 */
func someFunc(argumentLabel parameterName: Int) {
    
}

//FIXME:如果你为一个形式参数提供了实际参数标签，那么这个实际参数就必须在调用函数时候使用标签

func greetNew(person: String, from hometown: String) -> String {
    return "Hello, \(person) ! Glad you could visit form \(hometown)."
}

print(greetNew(person: "Bill", from: "Cupertino"))


//MARK:3.2 省略实际参数标签

/**
 如果对于函数的形式参数不想使用实际参数标签的话，可以利用下划线（_）来为这个形式参数代替显式的实际参数标签
 */

func someFunct(_ firstParameterName: Int, secondParameterName: Int) {
    
}

someFunct(1, secondParameterName: 2)



//MARK:3.3 默认形式参数值

/**
 你可以通过在形式参数类型后给形式参数赋一个值来给函数的任意形式参数定义一个默认值。如果定义了默认值，你就可以在调用函数时候省略这个形式参数
 */

func someFuncti(parameterWithDefault: Int = 12) {
    
}
someFuncti(parameterWithDefault: 6)
someFuncti()


//MARK:3.4 可变形式参数

/**
 一个可变心事参数可以接受零或者多个特定类型的值。当调用函数的时候你可以利用可变形式参数来声明形式参数可以被传入值的数量是可变的。可以通过在形式参数的类型名称后边插入三个点符号（...）来数次额可变形式参数
 */

func arithmeticMean(_ numbers: Double...) ->Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2, 3, 4, 5))

//FIXME:一个函数最多只能有一个可变形式参数


//MARK:3.5 输入输出形式参数

/**
 1.就像上面描述的，可变形式参数只能在函数的内部做改变。如果你想函数能够修改一个形式参数的值，而且你想这些改变在函数结束之后依然生效，那么就需要将形式参数定义为输入输出形式参数
 2. 在形式参数丁一开始的时候在前边添加一个 inout 关键字可以定义一个输入输出形式参数。输入输出形式参数有一个能输入给函数的值，函数能对其进行修改，还能输出到函数外边替换原来的值
 3.只能把变量作为输入输出形式参数的实际参数
 */

//FIXME:输入输出形式参数不能有默认值，可变形式参数不能标记为 inout, 如果你给一个形式参数标记了 inout,那么他们也不能标记 var 和 let 了。

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")



//MARK:-------------------------- 4 函数类型

/**
 每一函数都有一个特定的函数类型，他由形式参数类型，返回类型组成
 */

func addTwoInts( _ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/* (Int, Int) -> Int */

func printHelloWorld() {
    print("hello, world")
}

/* () ->Void */


//MARK:4.1 使用函数类型

/**
 你可以想使用swift中的其他类型 一样使用函数类型，例如：你可以给一个常量或者变量定义一个函数类型，并且为变量置顶一个相应的函数
 */
var mathFunction:(Int, Int) -> Int = addTwoInts(_:_:)/* 定义一个叫做mathFunction的变量，它的类型是 ‘一个能接受两个 Int值的函数，并返回一个 Int值’，将这个心的变量只想 addTwoInts函数 */

mathFunction = addTwoInts(_:_:)
print("Result:\(mathFunction(2, 3))")

mathFunction = multiplyTwoInts(_:_:)
print("Result:\(mathFunction(2, 3))")


//MARK:4.2 函数类型作为形式参数类型

/**
 你可以利用使用一个函数的类型例如(Int, Int) -> Int 作为其他函数的形式参数类型。这允许你预留函数的部分实现从而让函数的调用者在调用函数的时候提供
 */

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts(_:_:), 3, 5)


//MARK:4.3 函数类型作为返回类型

/**
 你可以利用函数的类型作为另一个函数返回类型。写法是在函数的返回箭头 （->）后立即写一个完整的函数类型
 */

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) ->Int {
    return backwards ? stepBackward(_:) : stepForward(_:)
}

var currentValue = 3
let moveNeareerToZero = chooseStepFunction(backwards: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNeareerToZero(currentValue)
}



//MARK:-------------------------- 5 内嵌函数

/**
 1.到目前为止，你在本章中遇到的所有函数都是全局函数，都是在全局的范围内进行定义的。你也可以在函数的内部定义另外一个函数。这就是内嵌函数
 2. 内嵌函数在默认情况下在外部是被隐藏起来的，但却仍然可以通过包裹它们的函数来调用它们。包裹的函数也可以返回他每部的一个内嵌函数在另外的范围里使用
 */

func choseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward : stepForward
}
var currentVal = -4
let moveNearerToZero = choseStepFunction(backward: currentVal > 0)

while currentVal != 0 {
    print("\(currentVal)...")
    currentVal = moveNearerToZero(currentVal)
}
print("zero!")
