//
//  main.swift
//  swift4.2(枚举)
//
//  Created by 范云飞 on 2018/7/25.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:------------------------------------ 枚举 --------------------------------

/**
 枚举为一组相关值定义了一个通用类型，从而可以让你在代码中类型安全地操作这些值
 */

//MARK:-------------------------- 1 枚举语法

/**
 1.你可以用enum 关键字来定义一个枚举
 */

enum SomeEnumeration {
    
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

//FIXME:不像 C和Objective-C 那样，swift的枚举成员在被创建时不会分配一个默认的整数值。在上文的CompassPoint 例子中， north、south、east 和 west 并不代表 0、1、2、3。 而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在CompassPoint中被显式定义的类型

/**
 2. 多个成员值可以出现在同一行中，要用逗号隔开
 */

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print(directionToHead)



//MARK:-------------------------- 2 使用 Switch 语句来匹配枚举值

/**
 你可以用switch 语句来匹配每一个单独的枚举值：
 */

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
/**
 1. 就像在控制流中所描述的那样，当判断一个枚举成员时，switch 语句应该是全覆盖的。如果 .west 的 case 被省略了，那么代码将不能编译，因为这时表明它并没有覆盖 CompassPoint 的所有成员。要求覆盖所有枚举成员是因为这样可以保证枚举成员不会意外的被漏掉
 2. 如果不能为所有枚举成员都提供一个 case ,那你也可以提供一个 default 情况来包含那些不能被明确写出的成员：
 */

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place humans")
}



//MARK:-------------------------- 3 遍历枚举情况（case）

/**
 对于某些枚举来说，如果能有一个集合包含了枚举的所有情况就好了。你可以通过在枚举名字后面写：
  CaseIterable 来允许枚举被遍历。swift 会暴露一个包含对应枚举类型所有情况的集合名为 allCases。
 */

enum Gait{
    static var allCases: [Gait] {
        return [.coffee, .tea, .juice]
    }
    case coffee
    case tea
    case juice
}
let numberOfChoices = Gait.allCases.count
print("\(numberOfChoices) beverages available")



//MARK:-------------------------- 4 关联值

/**
 你可以定义swift枚举来存储任意给定类型的关联值，如果需要的话不同枚举成员关联值的类型可以不同
 */

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

/**
 定义一个叫做 Barcode的枚举类型，它要么用(Int, Int, Int, Int) 类型的关联值获取 upc 值，要么用 String 类型的关联值获取一个 qrCode的值。
 */

var porductBarcode = Barcode.upc(8, 85909, 51226, 3)

porductBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/**
 和以往一样，不同的条码类型可以用 switch 语句来检查。相关值可以被提取为switch语句的一部分。你提取的每一个相关值都可以作为常量（用let 前缀）或者变量（用var 前缀）在 switch 的case 中使用：
 */

switch porductBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC:\(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

/**
 如果对于一个枚举成员的所有的相关值都被提取为常量，或如果都被提取为变量，为了简洁，你可以用一个单独的var 或者 let 在成员名称前标注：
 */

switch porductBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}



//MARK:-------------------------- 5 原始值

/**
 作为相关值的另一种选择，枚举成员可以用相同类型的默认值预先填充（称为原始值）
 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//FIXME:原始值与关联值不同。原始值是当你第一次定义枚举的时候，它们用来预先填充的值，正如上面的三个ASCII码。特定枚举成员的原始值是始终相同的。关联值在你基于枚举成员的其中之一创建新的常量或变量时设定，并且在你每次这么做的时候这些关联值可以是不同的。



//MARK:5.1 隐式指定的原始值

/**
 当你在操作存储整数或字符串原始值枚举的时候，你不必显式地给每一个成员都分配原始值。当你没有分配时，swift将会自动为你分配值
 */

/**
 1.实际上，当整数值被用于作为原始值时，每个成员的隐式值都比前一个大1.如果第一个成员没有值，那么他的值是0
 */

enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

/**
 2. 单字符串被用于原始值，那么每一个成员的隐式原始值则是那个成员的名称
 */

enum CompassPoint1: String {
    case north, south, east, west
}

let earthsOrder = Planet1.earth.rawValue
print(earthsOrder)

let sunsetDirection = CompassPoint1.west.rawValue
print(sunsetDirection)


//MARK:5.2 从原始值初始化

/**
 如果你用原始值类型来定义一个枚举，那么枚举就会自动收到一个可以接受原始值类型的值的初始化器（叫做 rawValue的形式参数）然后返回一个枚举成员或者 nil。 你可以使用这个初始化器来尝试创建一个枚举的新实例
 */

let possiblePlanet: Planet1? = Planet1(rawValue: 10)
print(possiblePlanet as Any)
/**
 在上面的例子中，不是所有可能的Int 值都会对应一行星。因此原始值的初始化器总是返回可选的枚举成员。possiblePlanet的类型是 Planet1? 或者 “可选项Planet”
 */

//FIXME:原始值初始化器是一个可失败初始化器，因为不是所有原始值都将返回一个枚举成员

let positionToFind = 11
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}



//MARK:-------------------------- 6 递归枚举

/**
 枚举在对序号考虑固定数量可能性的数据建模是表现良好，比如：用来做简单整数的运算符
 */

/**
 1. 储存简单数学运算表达式的枚举
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

/**
 2. 你同样可以在枚举之前写 indirect 来让整个枚举成员在需要时可以递归
 */

indirect enum ArithmeticExpressionNew {
    case number(Int)
    case addition(ArithmeticExpressionNew, ArithmeticExpressionNew)
    case multiplication(ArithmeticExpressionNew, ArithmeticExpressionNew)
}

/**
 上面的例子中，这个枚举可以储存三种数学运算表达式：单一的数字，两个两个表达式的加法，以及两个表达式的乘法
 addition 和 multiplication 成员拥有同样是数学表达式的关联值----这些关联值让嵌套表达式称为可能。比如说，表达式（5+4）*2 乘号右侧有一个数字，左侧有其他表达式。由于数据时内嵌的，用来储存数据的枚举同样要支持内嵌--------这就是说枚举需要递归。下边的代码展示了为（5+4） * 2 创建的递归枚举ArithmeticExpression:
 */


let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
print(five)



/**
 3. 判断数学表达式的函数
 */


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))
/* 这个函数通过直接返回关联值来判断普通数字。它通过衡量表达式左手侧和右手侧判断是加法还是乘法，然后对它们加或者成 */

