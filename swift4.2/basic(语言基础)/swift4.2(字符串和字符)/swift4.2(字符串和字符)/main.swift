//
//  main.swift
//  swift4.2(字符串和字符)
//
//  Created by 范云飞 on 2018/7/22.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:---------------------------------------- 字符创和字符-------------------------------------

//FIXME:swift 的 String 类型桥接到了基础库中的 NSString类。Foundation 同时也扩展了所有 NSString 定义的方法给 String。 也就是说，如果你导入Foundation, 就额可以在 String 中访问所有的 NSString 方法，无需转换格式。

//MARK:----------------------------- 1 字符串字面量

/**
 1.如果你需要很多行的字符串，使用多行字符串字面量。多行字符串字面量是用三个双引号引起来的一系列字符：
 */
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

/**
 2.要在多行字符串中包含 """ , 你必须用反斜杠（\）转义至少其中一个双引号
 */
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)


/**
 3.在上面的例子中，字符串字面来个包含了双引号包括的所有行，字符串起始于三个双引号（"""）之后的第一行，结束于三个双引号（"""）之前的一行，也就是 双引号 不会开始或结束带有换行。下面的两个字符串是一样的
 */

let singleLineString = "These are the same"
let multilineString = """
These are the same
"""
print(singleLineString)
print(multilineString)


/**
 4.要让多行字符串字面量开始或结束带有换行，写一个空行作为第一行或者是最后一行，比如：
 */

let instanceString = """

This string starts with a line feed.
It also ends with a line feed

"""
print(instanceString)

let linesWithIndentation = """

   This line doesn't begin with whitespace
        This line begins with four spaces
   This line doesn't begin with whitespce
   """

print(linesWithIndentation)

/*
 从上面的例子中可以看出：
 1. 如果你在某行的空格超过了结束的双引号（"""）,那么这些空格会被包含
 2. 每行的字符不能在结束的 """ 的后面，至少要和 """ 对齐
 */

//MARK:----------------------------- 2 初始化一个空字符串

/**
 为了绑定一个更长的字符串，要在一开始创建一个空的String 值， 要么赋值一个空的字符串字面量给变量，要么使用初始化器语法来初始化一个新的 String 实例：
 */

var emptyString = ""
var anotherEmptyString = String()

/* 通过检查布尔量 isEmpty 属性来确认一个String 值是否为空 */
if emptyString.isEmpty {
    print("Nothing to see here")
}



//MARK:----------------------------- 3 字符串可变性

/**
 你可以通过把一个 String 设置为变量（这里指可被修改），或者为常量（不能被修改），来置顶它是否可以被修改（或者改变）：
 */

var variableString = "Horse"
variableString += " and carriage"

//let constantString = "Highlander"
//constantString += "and another Highlander"

//FIXME:这个功能与Objective-C 和Cocoa 中的字符串改变不同，通过选择不同的类（NSString 和NSMutableString）来明确字符串是否可被修改



//MARK:----------------------------- 4 字符串是值类型
/**
 swift 的 String 类型是一种值类型。如果你创建了一个新的String值， String 值在传递给方法或者函数的时候会被复制过去，还有赋值给常量或者变量的时候也是一样。每一次赋值和传递，现存的String值都会被复制一次，传递走的是拷贝而不是原本
 */



//MARK:----------------------------- 5 操作字符

/**
 你可以通过 for-in 循环遍历 String 中的每一个独立的 Character值：
 */

for character in "Dog!?" {
    print(character)
}

let exclamationMark:Character = "g"
print(exclamationMark)

/* String  值可以通过传入 Character 值的字符串作为实际参数到它的初始化器来构造： */
let catCharacters:[Character] = ["C","a","t","!","?"]
let catString = String(catCharacters)
print(catString)


//MARK:----------------------------- 6 连接字符串和字符

/**
 1.String 值能够被加起来（或者说连接），使用加运算符（+）来创建新的String值：
 */

let string1 = "hello"
let string2 = "there"
var welcome = string1 + string2
print(welcome)

/**
 2.你同样也可以使用加赋值符号 （+=）在已经存在的 String 值末尾追加一个 String 值：
 */

var instruction = "look over"
instruction += string2
print(instruction)


/**
 3.你使用 String 类型的 append() 方法来可以给一个 String 变量的末尾追加 Character 值：
 */

welcome.append(exclamationMark)
print(welcome)

//FIXME:你不能把 String 或者 Character 追加到已经存在的 Character 变量当中，因为 Character 值能且只能包含一个字符



//MARK:----------------------------- 7 字符串插值

/**
  字符串插值是一种从混合常量、变量、字面量和表达式的字符串字面量构造新 String值的方法。每一个你插入到字符串字面量的元素都要被一对圆括号包裹，让后使用反斜杠前缀：
 */

let multiplier = 3;
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)

//FIXME:你作为插值写在圆括号中的表达式不能包含非转移的双引号（"）或者反斜杠（\）,并且不能包含回车或者换行符。总之，它们可以包含其他字符串字面量



//MARK:----------------------------- 8 Unicode

/**
 Unicode 是一种在不同书写系统中编码、表示、和处理文本的国际标准。它允许你表示几乎标准化格式的任何语言中的任何字符，并且为外部源比如文本文档或者网页读写这些字符。如同这节中描述的那样，swift 的 String 和 Character 类型是完全Unicode 兼容的
 */

//MARK:8.1 Unicode标量

/**
 面板之下，swift 的原生 String 类型建立在Unicode 标量值之上。一个Unicode标量是一个为字符或者修饰符厂家的独一无二的21位数字。
 */

//FIXME:Unicode 标量码位位于 U+0000 到 U+D7FF 或者 U+E000 到 U+10FFFF 之间。 Unicode 标量码位不包括从 U+D800 到 U+DFFF 的16位码元码位。注意不是所有的21位 Unicode 标量都指定了字符----有些标量是为将来所保留的。


//MARK:8.2 字符串字面量中的特殊字符
/**
 字符串字面量能包含以下特殊字符：
    转义特殊字符 \0 (空字符)
    \\ (反斜杠)
    \t (水平制表符)
    \n (换行符)
    \r (回车符)
    \" (双引号)
    \' (单引号)
 
 任意的Unicode 标量， 写作 \u{n},里面的n 是一个1-8个与合法 Unicode 码位相等的16进制数字
 */


let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)

let dollarSign = "\u{24}"
print(dollarSign)

let blackHeart = "\u{2665}"
print(blackHeart)

let sparklingHeart = "\u{1F496}"
print(sparklingHeart)



//MARK:8.3 扩展字形集群

/**
 每一个swift 的 Character 类型实例都表示了单一的扩展字形集群。扩展字形集群是一个或者多个有序的 Unicode 标量（当组合起来是）产生的单个人类可读字符。
 */
let eAcute: Character = "\u{E9}"
print(eAcute)

let combinedEAcute: Character = "\u{65}\u{301}"
print(combinedEAcute)

let precomposed: Character = "\u{D55C}"
print(precomposed)

let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
print(decomposed)



//MARK:----------------------------- 9 字符统计

/**
 要在字符串中取回 Character 值的总数， 使用字符串的 count 属性：
 */

let unusualMenagerie = "Koala ?, Snail ?, Penguin ?, Dromedary ?"
print("unusualMenagerie has \(unusualMenagerie.count) characters ")


//FIXME:swift 为 Character 值使用的扩展字形集群意味着字符串的创建和修改可能不会总是影响字符串的字符统计数， 例如下面的例子：
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

//FIXME:字符串中字符的数量如果不遍历它的扩展字形集群边界的话，是不能被计算出来的。如果你在操作特殊的长字符串值，要注意 count 属性为了确定字符串中的字符要遍历整个字符串的 Unicode 标量

//FIXME:通过 count 属性返回字符统计 并不会总是与包含相同字符的 NSString 中 length 属性相同。 NSString 中的长度是基于在字符串的 UTF-16 表示中16位码元的数量来表示的，而不是字符串中 Unicode 扩展字形集群的数量


//MARK:----------------------------- 10 访问和修改字符串

/* 你可以通过下标脚本语法或者它自身的属性和方法来访问和修改字符串 */

//MARK:10.1 字符串索引

/**
 1.每一个 String 值都有相关的索引类型， String.Index， 它相当于每个 Character 在字符串中的位置。
 */
//FIXME:2.不同的字符会获得不同的内存空间来储存，所有为了明确哪个 Character 在哪个特定的位置，你必须从 String 的开头或结尾遍历每一个Unicode 标量。因此，swift的字符串不能通过整数值索引。

/**
 3.使用 startIndex 属性来访问 String 中第一个 Character 的位置。 endIndex 属性就是 String 中最后一个字符后的位置。所以说， endIndex 属性并不是字符串下标脚本的合法实际参数。如果 String 为空，则 startIndex 与 endIndex 相等。
 4.使用 index(before:) 和 index(after:) 方法来访问给定索引的前后。要访问给定索引更远的索引，你可以使用 index(_:offsetBy:) 方法而不是多次调用这两个方法
 */


let greeting = "Guten Tag!"
print(greeting[greeting.startIndex])

print(greeting[greeting.index(before: greeting.endIndex)])

print(greeting[greeting.index(after: greeting.startIndex)])

let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

/* 尝试访问的 Character 如果索引位置在字符串范围之外，就会触发运行时错误 */
//print(greeting[greeting.endIndex])

/**
 5. 使用indices 属性来访问字符串中每个字符的索引
 */

for index in greeting.indices {
    print("\(greeting[index])", terminator:"")
}

//FIXME:你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:), index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String，还有集合类型比如 Array， Dictionary 和 Set


//MARK:10.2 插入和删除

/**
 1.要给字符串的特定缩影位置插入字符，使用 insert(_:at:)方法，另外要冲入另一个字符串的内容到特定的索引，使用 insert(contentsOf:at:)方法。
 */

var welcome1 = "hello"
welcome1.insert("!", at: welcome1.endIndex)
print(welcome1)

welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))

print(welcome1)

/**
 2.要从字符串的特定索引为移除字符，使用 remove(at:)方法，另外要移除一小段特定范围的字符串，使用removeSubrange(_:) 方法：
 */

welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
print(welcome1)

//FIXME:你可以在任何遵循了 RangeReplaceableIndexable 协议的类型中使用 insert(_:at:), insert(contentsOf:at:), remove(at:) 方法。这包括了这里使用的 String， 同样还有集合类型比如 Array，Dictionary 和Set。



//MARK:----------------------------- 11 子字符串

/**
 与字符串不同，在字符串上执行动作的话你应该使用子字符串执行短期处理。当你想要把结果保存的长久一点时，你需要把子字符串转换为 String 实例
 */

let greeting1 = "Hello, world!"
let index1 = greeting1.index(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index1]
print(beginning)


let newString = String(beginning)

//FIXME:与字符串类型，每一个子字符串都有一块内存区用来保存组成子字符串的字符。字符串与子字符串的不同之处在于，作为性能上的优化，子字符串可以重用一部分用来保存原字符串的内存，或者是用来保存其他字符串的内存，这个性能优化意味着在你修改字符串或者子字符串之前都不需要花费拷贝内存的代价。如同上面所说的，子字符串并不适合长期保存-------因为他们重用了原字符串的内存，只要这个字符串有子字符串在使用中，那么这个字符串就必须一直保存在内存里。

//FIXME:String 和 Substring 都遵循 StringProtocol 协议，也就是说它基本上能很方便地兼容所有接受 StringProtocol 值的字符串操作函数。你可以无差别使用 String 或 Substring 值来调用这些函数。



//MARK:----------------------------- 12 字符串比较

/**
 swift 提供了三种方法来比较文本值：字符串和字符相等性，前缀相等性以及后缀相等性
 */

//MARK:12.1 字符串和字符相等性

/**
 1. 字符串和字符相等使用 "等于" 运算符 (==) 和 "不等" 运算符 （!=）进行检查：
 */
let quotation1 = "We're a lot alike, you and I"
let sameQuotation1 = "We're a lot alike, you and I"
if quotation1 == sameQuotation1 {
    print("These two strings are considered equal")
}

/**
 2. 两个 String 值（或者两个 Character值） 如果他们的扩展字形集群是规范化相等，则被认为是相等的。如果扩展字形集群拥有相同的语言意义和外形，我们就说它规范化相等，就算他们实际上是由不同的 Unicode 标量组合而成。
 */

let eAcuteQuestion1 = "Voulez-vous un caf\u{E9}?"

let combinedEAcuteQuestion1 = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion1 == combinedEAcuteQuestion1 {
    print("These two strings are considered equal")
}

//FIXME:字符串和字符比较在 swift 中并不区分区域设置


//MARK:12.2 前缀和后缀相等性

/**
 要检查一个字符串时否拥有特定字符串前缀或者后缀，调用字符串的 hasPrefix(_:) 和 hasSuffix(_:) 方法，它们两个都会接受一个 String 类型的实际参数并且返回一个布尔量值
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1")


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}

print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

//FIXME:hasPrefix(_:) 和 hasSuffix(_:) 方法只对字符串当中的每一个扩展字形集群之间进行了一个逐字符的规范化相等比较



//MARK:----------------------------- 字符串的 Unicode 表示法

/**
  swift 提供了集中不同的方法来访问字符串的 Unicode 表示。 你可以使用 for -in语句来遍历整个字符串 或者 你也可以用一下三者之一的其他 Unicode 兼容表示法来访问 String 值：
    UTF-8 码元的集合
    UTF-16 码元的集合
    21位 Unicode标量值的集合，等同于字符串的UTF-32 编码格式
 */

let dogStr = "Dog‼?"


//MARK:13.1 UTF-8 表示法

for codeUnit in dogStr.utf8 {
    print("\(codeUnit) ", terminator:"")
}
print("")

//MARK:13.2 UTF-16 表示法

for codeUnit in dogStr.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")


//MARK:13.3 Unicode 标量表示法

for scalar in dogStr.unicodeScalars {
    print("\(scalar.value) ",terminator: "")
}
print("")


for scalar in dogStr.unicodeScalars {
    print("\(scalar)")
}
