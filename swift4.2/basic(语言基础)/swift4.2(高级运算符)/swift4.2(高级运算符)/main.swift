//
//  main.swift
//  swift4.2(高级运算符)
//
//  Created by 范云飞 on 2018/7/31.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:---------------------------- 高级运算符 -------------------------


/**
 1. 作为 《基本运算符》 的补充，swift 提供了一些对值进行更加复杂操作的高级运算符。这些运算符包括你在 C或Objective-C中所有按位运算符
 2. 与C 的算法运算符不同，swift 中算术运算符默认不会溢出。溢出的行为都会作为错误。要允许溢出行为，需要使用溢出运算符
 3. 你可以定义自己的运算符
 */


//MARK:------------------------ 1 位运算符

/**
 位运算符可以操作数据结构中每一个独立的位：
 1. 通常被用在底层开发中国
 2. 处理外部资源的原始数据
 */


//MARK:1.1 位取反运算符

/**
 位取反运算符（~）是对所有位的数字进行取反操作
 */

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits//对应的十进制的值为60
print(invertedBits)


//MARK:1.2 位与运算符

/**
 位与运算符（&）可以对两个数的比特位进行合并。它会返回一个新的数
 */

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits //对应的十进制的值为 60

print(middleFourBits)


//MARK:1.3 位或运算符

/**
 位或运算符 （|） 可以对两个比特位进行比较，然后返回一个新的数，只要两个操作位任意一个为 1 时，那么对应的位数就为1：
 */

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits//十进制数的值为 154

print(combinedBits)


//MARK:1.4 位异或运算符

/**
 位异或运算符，当两个操作数的对应位不相同时，该数的对应位就为1
 */

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits: UInt8 = firstBits ^ otherBits
print(outputBits)



//MARK:------------------------ 2 位左移和右移运算符

/**
 位左移运算符（<<） 和 位右移运算符（>>）可以把所有位数的数字向左或向右移动一个确定的位数。左移一位和右移一位具有给整数乘以2或除以2的效果
 */

//MARK:2.1 无符号整数的移位操作

/**
 无符号整数的移位规则如下：
 1. 已经存在的比特位按指定的位数进行左移和右移
 2. 任何移动超出整形存储边界的位都将会被丢弃
 3. 用 0 来填充向左或向右移动后产生的空白位
 */

let shiftBits: UInt8 = 4 //00000100
print(shiftBits << 1)//00001000
print(shiftBits << 2)//00010000
print(shiftBits << 3)
print(shiftBits << 4)
print(shiftBits << 5)
print(shiftBits << 6)

print(shiftBits >> 2)


//MARK:2.2 有符号整型的位移操作

/**
 1. 有符号整型使用它的第一位（所谓符号位）来表示这个整数是正数还是负数。符号为 0 表示为正数，1表示为负数。其余的位数（所谓的数值位）存储了实际的值。
 2. 负数的存储方式略有不同。它存储的是 2 的 n 次方减去它的绝对值，这里的 n 为数值位的位数
 */



//MARK:------------------------ 3 溢出运算符

/**
 在默认的情况下，当向一个整数赋超过它容量的值时，swift 会报错而不是生成一个无效的数。这个行为给我们操作过大或者过小的数的时候提供了额外的安全性
 */
var potentialOverflow = Int16.max
//potentialOverflow += 1

/**
 当你故意想要溢出来截断可用位的数字时，也可以选择这么做而非报错。swift 提供了三个算数 溢出运算符来让系统支持整数溢出运算：
  * 溢出加法 （&+）
  * 基础减法 （&-）
  * 溢出乘法 （&*）
 */

//MARK:3.1 值溢出

/**
 数值可能出现向上溢出或向下溢出：
 */

/**
 1. 无符号整数使用溢出加法 （&+）
 */
var unsignedOverflow = UInt8.max//255
unsignedOverflow = unsignedOverflow &+ 1//0
print(unsignedOverflow)

/**
 2. 无符号整数使用溢出减法（&-）
 */

var newUnsignedOverflow = UInt8.min//0
newUnsignedOverflow = newUnsignedOverflow &- 1//255
print(newUnsignedOverflow)

/**
 3. 有符号整型数值使用溢出加法 &+
 */

var anotherSignedOverflow = Int8.min//-128
anotherSignedOverflow = anotherSignedOverflow &- 1//127
print(anotherSignedOverflow)

//FIXME:对于无符号与有符号整型数值来说，当出现上溢时，它们会从数值所能容纳的最大数变成最小的数。同样地，当发生下溢时，它们会从所能容纳的最小数变成最大的数



//MARK:------------------------ 4 优先级和结合性

/**
 运算符的优先级使得一些运算符优先于其他运算符，高优先级的运算符会先被计算
 */



//MARK:------------------------ 5 运算符函数

/**
 类和结构体可以为现有的运算符提供自动的实现，这通常被称为 运算符 重载
 */

struct Vector2D {
    var x = 0.0 , y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

print(combinedVector)


//MARK:4.1 前缀和后缀运算符

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

print(negative)
print(alsoPositive)


//MARK:4.3 组合赋值运算符

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print(original)

//FIXME:不能对默认的赋值运算符（=）进行重载。只有组合赋值运算符可以被重载。同样地，也无法对三元条件运算符 a  ？ b : c 进行重载

//MARK:4.4 等价运算符

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

/**
 上面的例子实现了一个 “等于” 运算符 （==）来检查两个 Vector2D 实例是否拥有相同的值。
 */

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

/**
 swift 为以下自定义类型提等价运算符供合成实现：
   * 只拥有遵循 Equatable 协议存储属性的结构体
   * 只拥有遵循 Equatable 协议关联类型的枚举
   * 没有关联类型的枚举
 */

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent")
}



//MARK:------------------------ 6 自定义运算符

/**
 除了实现标准运算符，在swift 当中还可以声明 和实现自定义运算符。可以用来自定义运算符的字符列表可以参考运算符
 */

/**
 新的运算符要在全局作用域内，使用 operator 关键字进行声明，同时还要指定 prefix、infix、postfix 限定符：
 */

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print(afterDoubling)


//MARK:6.1 自定义中缀运算符的优先级和结合性

infix operator +-
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print(plusMinusVector)


//FIXME:当定义前缀与后缀运算符的时候，我们并没有指定优先级。然而，如果对同一个操作数同时使用前缀与后缀运算符，则后缀运算符会被应用。
