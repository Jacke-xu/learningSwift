//
//  main.swift
//  swift4.2(扩展)
//
//  Created by 范云飞 on 2018/7/29.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:---------------------------- 扩展 --------------------------

/**
 扩展为现有的类、结构体、枚举类型、协议添加新功能。与 Objective-C 中的分类类似，不同的是 swift的扩展没有名字
 swift中的扩展可以实现的功能：
 1. 添加计算实例属性和计算类型属性
 2. 定义实例方法和类型方法
 3. 提供新初始化器
 4. 定义下标
 5. 定义和使用新的内嵌类型
 6. 实现有的类型遵循某协议
 7. 扩展协议
 */

//FIXME:扩展可以向一个类型添加新的方法，但是不能重写已有的方法



//MARK:---------------------- 1 扩展的语法

/**
 1. 使用 extension 关键字来声明扩展：
 */

/**
 extension SomeType {
 
 }
 */

/**
 2. 扩展可以使已有的类型遵循一个或多个协议
 */

/**
 extension SomeType: SomeProtocol, AnotherProtocol {
 
 }
 */

//FIXME:如果你想已经存在的类型添加新功能，新功能会在该类型的所有实例中可用



//MARK:---------------------- 2 计算属性

/**
 扩展可以向已有的类型添加计算实例属性和计算类型属性
 */

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let ontInch = 25.4.mm

print("One inch is \(ontInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

//FIXME:扩展可以添加新的计算属性，但是不能添加存储属性，也不能向已有的属性添加属性观察者



//MARK:---------------------- 3 初始化器

/**
 扩展能为类添加新的便捷初始化器，但是不能为类添加指定初始化器或反初始化器。指定初始化器和反初始化器必须由原来类的实现提供
 */

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()

let memberwistRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))


extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//FIXME:如果你使用扩展提供了一个新的初始化器，你扔应确保每一个实例都在初始化器完成时完全初始化



//MARK:---------------------- 4 方法

/**
 扩展可以为已有的类型添加新的实例方法和类型方法
 */

extension Int {
    func repetitiions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitiions {
    print("hello")
}


//MARK:4.1 异变实例方法

/**
 增加了扩展的实例方法扔可以修改实例本身。结构体和枚举类型方法在修改 self 或 本身的属性时必须标记实例方法为 mutating
 */

extension Int {
    mutating func square() -> Int {
        self = self * self
        return self
    }
}

var someInt = 3
print("\(someInt.square())")



//MARK:---------------------- 5 下标

/**
 扩展能为已有的类型添加新的下标
 */

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print(74859494[0])



//MARK:---------------------- 6 内嵌类型

/**
 扩展可以为已有的类、结构体和枚举类型添加新的内嵌类型
 */

extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("-", terminator: " ")
        case .zero:
            print("0", terminator: " ")
        case .positive:
            print("+", terminator: " ")
        }
    }
    print("")
}


printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
