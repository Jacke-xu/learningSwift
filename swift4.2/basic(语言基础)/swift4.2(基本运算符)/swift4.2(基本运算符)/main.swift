//
//  main.swift
//  swift4.2(基本运算符)
//
//  Created by 范云飞 on 2018/7/22.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:-------------------------------------- 基本运算符 -----------------------------------

/**
 1.运算符是一种用来检查、改变或者合并值的特殊符号或组合符号
 2.swift 在支持C中的大多数标准运算符的同时也增加了一些排除常见代码错误的能力，比如算术符号（+，-，*，/,% 以及其他符号）可以检测并阻止值溢出，避免你在操作比存储类型允许的范围更大或者更小的数字是得到各种奇奇怪怪的结果，像 “溢出操作符” 中描述的那样，你可以通过使用swift 的溢出操作符来选择进入值溢出的行为模式
 3.swift 提供了两种C中没有的区间运算符（a..<b 和 a...b），来让你便捷表达某个范围的值
 4.本章节叙述了swift语言当中常见的运算符。高级运算符 则涵盖了swift 中的高级运算符， 同时描述了如何定义你自己的运算符以及在你自己类当中实现标准运算符
 */



//MARK:---------------------------- 1 专门用语

/**
 运算符包括 一元、二元、三元：
 1.一元运算符对一个目标进行操作 比如：-a
 2.二元运算符对两个目标进行操作 比如： 2+3
 3.三元运算符操作三个目标，如同C, swift语言也仅有一个三元运算符，三元条件运算符（a?b:c）
 */



//MARK:---------------------------- 2 赋值运算符

/**
 赋值运算符（a = b）可以初始化或者更新 a 为 b 的值
 */

let b = 10
var a = 5
a = b

/* 如果赋值运算符号右侧是拥有多个值的元组，它的元素将会一次性地拆分成常量或者变量： */
let (x, y) = (1, 2)

/* 与Objective-C和C 不同， swift的赋值符号自身不会返回值。下面的语句是不合法的： */
//if x = y {
//    //这是不合法的，因为x = y 并不会返回任何值
//}

/* 这个特性避免了赋值符号 “=” 被意外地用于等于符号 “==” 的实际意图上。swift通过让 if x = y 非法来帮助你避免这类的错误在你代码中出现 */



//MARK:---------------------------- 3 算术运算符

/**
 1.swift 对所有的数字类型支持四种标准算术运算符：加 （+）、减（-）、乘（*）、除（/）
 2. 与C和Objective-C 中的算术运算符不同，swift算术运算符默认不允许值溢出。你可以选择使用swift 的溢出操作符（比如 a &+ b）来行使溢出行为
    溢出加法 （ &+ ）
    溢出减法 （ &- ）
    溢出乘法 （ &* ）
 */

/* 加法运算符同时也支持 String 的拼接 */
let str = "hello," + "world"
print(str)



//MARK:3.1 余数运算符

/* 余数运算符（a % b）可以求出多少个 b 的倍数能够刚好放进 a 中并且返回剩下的值（就是我们所谓的余数） */


//MARK:3.2 一元减号运算符

/* 数字值的正负号可以用前缀 - 来切换，我们称之为 一元减号运算符： */

let three = -3
let minusThree = -three
let plusThree = -minusThree

/* 一元减号运算符（-）直接在要进行操作的值前边放置，不加任何空格 */


//MARK:3.3 一元加号运算符

/* 一元加号运算符（+）直接返回它操作的值，不会对其进行任何的修改： */
let minusSix = -6
let alsoMinusSix = +minusSix
/* 尽管一元加号运算符实际上什么也不做，你还是可以像对正数一样，使用它来让你的代码对一元减号运算符来说显得更加对称 */



//MARK:---------------------------- 4 组合赋值符号

/**
 如同C， swift 提供了由赋值符号 （=）和其他符号组成的 组合赋值符号。一个加赋值符号的例子 （+=）：
 */
var d = 1
d += 2

//FIXME:组合运算符不会返回任何值，举例来说，你不能携程这样 let b = a += 2 . 这个与前边提到的增量和减量符号的行为不同



//MARK:---------------------------- 5 比较运算符

/**
 swift 支持所有 C 的标准比较运算符
   * 相等 （a == b）
   * 不相等 （a != b）
   * 大于 （a > b）
   * 小于 （a < b）
   * 大于等于 （a >= b）
   * 小于等于 （a <= b）
 每个比较运算符都会返回一个Bool 值来表示语句是否为真
 */

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recongnize you")
}


//FIXME:swift 同时也提供两个等价运算符 （=== 和 !==），你可以使用它们来判断两个对象的引用是否相同

/**
 1. 你同样可以比较拥有同样数量值的元组，只要元组中的每个值都是可比较。比如说，Int 和 String 都可以用来比较大小，也就是说（Int， String） 类型的元组就可以比较。一般来说，Bool 不能比较，这意味着包含布尔值的元组不能用来比较大小
 2. 元组以从左到右的顺序比较大小，一次一个值，知道找到两个不相等的值为止。如果所有的值都是相等的，那么就认为元组本身是相等的
 */

if (1, "zebra") < (2, "apple") {
    print("\(1) < \(2)")
}

if (3, "apple") < (3, "bird") {
    print("apple < bird")
}

if (0, "dog") < (1, "dong") {
    print("\(0) < \(1)")
}

//FIXME:swift 标准库包含的元组比较运算符仅支持小于七个元素的元组。要比较拥有七个或者更多元素的元组，你必须自己实现比较运算符



//MARK:---------------------------- 6 三元条件运算符

/**
 三元条件运算符是一种有三部分的特殊运算，它看起来是这样的：question ? answer1 : answer2 。这是一种基于 question 是真还是假来选择两个表达式之一的便捷写法。如果 question 是真，则会判断为 answer1 并且返回它的值；否则，它判断为 answer2 并且返回它的值，可以简写：
 */

let question: String? = "fanyunfei"
let answer1:String? = "yun"
let answer2:String? = "fei"
if let _: String = question {
    print(answer1!)
} else {
    print(answer2!)
}

/* 三元条件运算符提供了一个非常有效的简写来决策要两个表达式之间选哪个。总之，使用三元条件运算符要小心。它的简洁性会导致你代码重用的时候逝去易读的特性。避免把多个三元条件运算符组合到一句代码当中 */



//MARK:---------------------------- 7 合并空值运算符

/**
 合并空值运算符( a ?? b) 如果可选项 a 有值则展开，如果没有值，是 nil， 则返回默认值 b。 表达式 a 必须是一个可选类型。表达式 b 必须 与 a 的存储类型相同。完成的代码书写格式如下：
 a != nil ? a! : b
 */

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)


let defaultColorName1 = "red"
var userDefinedColorName1: String? = "green"
var colorNameToUse1 = userDefinedColorName1 ?? defaultColorName1
print(colorNameToUse1)



//MARK:---------------------------- 8 区间运算符

/* swift 包含了两个区间运算符，它们是表示一个范围的值的便捷方式 */

//MARK:8.1 闭区间运算符

/**
 闭区间运算符 (a...b) 定义了从 a 到 b 的一组范围，并且包含 a 和 b 。a 的值不能大于 b。
 */

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//MARK:8.2 半开区间运算符

/**
 1.半开区间运算符 (a..<b) 定义了从 a 到 b 但不包括 b 的区间，即半开，因为它只包含起始值但并不包含结束值。如同闭区间运算符， a 的值也不能大于 b， 如果 a 与b 的值相等，那返回的区间将会是空的
 2.半开区间在遍历基于零开始序列比如说数组的时候非常有用，它从零开始遍历到数组长度
 */

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i  in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//MARK:8.3 单侧区间

/**
 闭区间有另外一种形式来让区间朝一个方向尽可能的远------比如说，一个包含数组所有元素的区间，从从索引 2 到 数组的结束。 在这种情况下，你可以省略区间运算符一侧的值。因为运算符只有一侧有值，所以这种区间叫做单侧区间，比如说：
 */

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

/* 半开区间运算符同样可以有单侧形式，只需要写它最终的值。和两侧都包含值一样，最终的值不是区间的一部分 */

for name in names[..<2] {
    print(name)
}

/* 单侧区间可以在其他上下文中使用 ，不仅仅是下标*/



//MARK:---------------------------- 9 逻辑运算符

/**
 逻辑运算符可以修饰或者合并布尔逻辑值 true 和 false 。 swift 支持三种其他基于 C的语言也包含的标准逻辑运算符
 逻辑 非 （！a）
 逻辑 与 （a && b）
 逻辑 或 （a || b）
 */


//MARK:9.1 逻辑非运算符

/**
 逻辑非运算符 （！a） 会转换布尔值，把true 变成 false， 把false 变成true。 是一个前缀运算符，他直接写在要进行运算的值前边，不加空格
 */

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}


//MARK:9.2 逻辑与运算符

/**
 逻辑与运算符 （a && b） 需要逻辑表达式的两个值都为true， 整个表达式的值才为 true
 */

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


//MARK:9.3 逻辑或运算符

/**
 逻辑或运算符 （a || b）是一个中缀运算符，它由两个响铃的管道字符组成。你可以使用它来创建liangge值之间只要有一个为true 那么整个表达之就是 true 的逻辑表达式
 */

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}


//MARK:9.4 混合逻辑运算

/**
 你可以组合多个逻辑运算符来创建一个更长的组合表达式
 */

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//FIXME:swift 语言中逻辑运算符 && 和 || 是左相关的， 这意味着多个逻辑运算符的表达式会首先计算最左边的子表达式


//MARK:9.5 显示括号

/**
 很多时候虽然不被要求，但使用括号还是很有用的，这能让复杂的表达式更容易阅读。在上文当中的门禁例子里，把前边部分的表达式用圆括号括起来就会让整个组合表达式的意图更加明显：
 */

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

/* 代码的可读性永远是第一位的，当需要的时候，使用圆括号让你的意图更加的明确 */
