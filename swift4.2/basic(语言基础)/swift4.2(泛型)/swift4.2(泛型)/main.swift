//
//  main.swift
//  swift4.2(泛型)
//
//  Created by 范云飞 on 2018/7/30.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:-------------------------- 泛型 ------------------------------

/**
 泛型代码让你能根据你所定义的要求写出可以用于任何类型的灵活的、可复用的函数。你可以编写出可复用、意图表达清晰、抽象的代码
 */



//MARK:---------------------- 1 泛型解决的问题

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


/**
 上面的swapTwoInts(_:_:) 函数很实用，但是它只能用于 Int 值。如果你想要交换两个 String 值，或者两个 Double值，你只能再写更多的函数。比如：
 */

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}



//MARK:---------------------- 2 泛型函数

/**
 泛型函数可以用于任何类型。这里是上面提到的 swapTwoInts(_:_:) 函数的泛型版本，叫做 swapTwoValues(_:_:)
 */

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/**
 泛型版本的函数用了一个占位符类型名（这里叫做 T），而不是一个实际的类型名（比如 Int、String或Double）。占位符类型名没有声明 T 必须是什么样的，但是它确实说了 a 和 b 必须都是同一个类型 T，或者说都是 T 所表示的类型。替代 T 实际使用的类型将在每次调用 swapTwoValues(_:_:) 函数时决定
 */

var another = 3
var newAnotherInt = 107
swapTwoValues(&another, &newAnotherInt)

print("another is \(another), newAnotherInt is \(newAnotherInt)")


var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

print("someString is \(someString), anotherString is \(anotherString)")



//MARK:---------------------- 3 类型形式参数

/**
 上面的 swapTwoValues(_:_:)中，占位符类型 T 就是一个类型形式参数的例子。类型形式参数指定并且命名一个占位符类型，紧挨着写在函数名后面的一对尖括号里（比如<T>）
 */


//MARK:---------------------- 4 命名类型形式参数

/**
 大多数情况下，类型形式参数的名字要有描述性，比如 Dictionary<Key, Value> 中的Key 和 Value
 */


//MARK:---------------------- 5 泛型类型

/**
 除了泛型函数，swift允许你定义自己的泛型类型。它们可以是用于任意类型的自定义类、结构体、枚举 和 Array、Dictionary方式类似。
 本章将展示 如何写出一个叫做 Stack 的泛型集合类型。栈是值的有序集合，和数组类似，但是，栈的新元素只能添加到集合的末尾（这就是所谓的压栈）。同样，栈只允许从集合的末尾移除元素（这就是所谓的出栈）。
 */

struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

/**
 这个泛型的 Stack 和 非泛型版本的本质上是一样的，只是用一个叫做 Element 的类型形式参数代替了实际的 Int 类型。这个类型形式参数写在一对尖括号(<Element>) li，紧跟在结构体名字后面。
 */

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTo = stackOfStrings.pop()


//MARK:---------------------- 6 扩展一个泛型类型

/**
 当你扩展一个泛型类型时，不需要再扩展的定义中提供类型形式参数列表。原始类型定义的类型形式参数列表在扩展体里仍然有效。并且原始类型形式参数列表名称也用于扩展类型形式参数
 */

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}


if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}



//MARK:---------------------- 7 类型约束

/**
 1. swapTwoValues(_:_:) 函数和 Stack 类型可以用于任意类型。但是，有时在用于泛型函数的类型和泛型类型上，强制其遵循特定的类型约束很有用。类型约束指出一个类型形式参数必须继承自特定类或者遵循一个特定的协议、组合协议。
 2. swift 的 Dictionary 类型在可以用于字典中键的类型上设置了一个限制。字典键的类型必须是可哈希的。也就是说，它必须提供一种使其可以唯一表示的方法。这个要求通过Dictionary键类型上的类型约束实现。所有swift 基本类型（比如 String、Int、Double、Bool） 默认都是可哈希的
 */



//MARK:7.1 类型约束语法

/**
 在一个类型形式参数名称后面放置一个类或者协议作为形式参数列表的一部分，并用冒号隔开，以写出一个类型约束。
 */

/**
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 
 }
 */


//MARK:7.2 类型约束的应用



func findIndex(ofString valueToFind: String , in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let  strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}


//func findIndex<T>(of valueToFind: T, in array: [T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}

/**
 1. 上面的例子会报编译错误，问题在于相等检查， swift 中的类型不是每种都能用相等操作符 （==）来比较的。比如，对于哪个类或者结构体来说，“相等”的意义不是swift能替你才出来的。
 2. swift 标准库中定义了一个叫做 Equatable 的协议，要求遵循其协议的类型要实现相等操作符（==） 和 不相等操作符 （！=），用于比较该类型的任意两个值。所以上面的例子可以改写为：
 */

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let doubleIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
print("doubleIndex is \(doubleIndex!)")



//MARK:---------------------- 8 关联类型

/**
 定义一个协议时，有时在协议定义里声明一个或多个关联类型是很有用的。关联类型给协议中用到的类型一个占位符名称。知道采纳协议时，才指定用于该关联类型的实际类型。关联类型通过associatedtype关键字指定
 */

//MARK:8.1 关联类型的应用

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

/**
 Container 协议定义了三个所有容器必须提供的功能
 * 必须能够通过 append(_:) 方法向容器中添加新元素
 * 必须能够通过一个返回 Int 值的 count 属性获取容器中的元素数量
 * 必须能够通过 Int 索引值的下标 去除容器中每个元素
 */

struct NewStack: Container {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

/**
 上面的例子中 ItemType 被声明为 Int，实际上不同声明
 */

struct AnotherNewStack<Element>: Container {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}




//MARK:8.2 给关联类型添加约束

/**
 你可以在协议里给关联类型添加约束来要求遵循的类型满足约束
 */

protocol NewContainer {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//FIXME:8.3 还有疑问
//MARK:8.3 在关联类型约束里使用协议

/**
 协议可以作为它自身的要求出现。比如说，这里有一个协议细化了 Container 协议，添加了一个 suffix(_:) 方法。suffix(_:) 方法返回容器中从后往前给定数量的元素，把它们存储在一个 Suffix 类型的实例里。
 */

protocol SuffixableContainer: NewContainer {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}


extension NewStack: SuffixableContainer {
    func suffix(_ size: Int) -> NewStack {
        var result = NewStack()
        for index in (count - size)..<count{
            result.append(self[index])
        }
        return result
    }
}

var stackOfInts = NewStack()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)



//MARK:8.4 扩展现有类型类指定关联类型

/**
 你可以扩展一个现有类型使其遵循一个协议
 */

extension Array: Container {}



//MARK:---------------------- 9 泛型Where 分句


func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
    }


var stackOfStrings1 = AnotherNewStack<String>()
stackOfStrings1.push("uno")
stackOfStrings1.push("dos")
stackOfStrings1.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings1, arrayOfStrings) {
    print("All items match")
} else {
    print("Not all items match")
}


/**
 下面是函数的两个类型形式参数上设置的要求：
 * C1 必须遵循 Container 协议 （写作 C1:Container）;
 * C2 必须遵循 Container 协议 （写作 C2:Container）;
 * C1 的 ItemType 必须 和C2 的ItemType 相同 （写作 C1.ItemType == C2.ItemType）;
 * C1 的 ItemType 必须遵循 Equatable 协议 （写作 C1.ItemType: Equatable）
 */



//MARK:---------------------- 10 带有泛型 Where 分句的扩展


extension AnotherNewStack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackOfStrings1.isTop("uno") {
    print("Top element is tres")
} else {
    print("Top element is something else")
}


extension NewContainer where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}


extension NewContainer where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}



//MARK:---------------------- 11 关联类型的泛型 Where 分句

/**
 你可以在关联类型中包含一个泛型 where 分句。
 */
protocol AnotherNewContainer {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
    
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}



//MARK:---------------------- 12 泛型下标

/**
 下标可以是泛型，它们可以包含泛型 where 分句。
 */

extension NewContainer {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
        where Indices.Iterator.Element == Int {
        var result = [Item]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}
