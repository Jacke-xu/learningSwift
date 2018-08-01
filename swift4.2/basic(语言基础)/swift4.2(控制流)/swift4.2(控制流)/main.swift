//
//  main.swift
//  swift4.2(控制流)
//
//  Created by 范云飞 on 2018/7/23.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:---------------------------------- 控制流 -----------------------------------

/**
 1. swift 提供所有多样化的控制流语句。包括while 循环来多次执行任务、if、guard和switch 语句来基于特定的条件执行不同的代码分支；还有比如 break 和continue 语句来传递执行的另一个点上
 2. swift 同样添加了 for-in 循环，它让你更简便地遍历数组、字典、范围和其它xulie
 3. swift 的switch 语句同样比C中的对应语句多了不少新功能。比如：swift中的switch语句不在贯穿到下一个情况当中，这就避免了C中常见的break 语句丢失问题。情况可以匹配多种模式，包括间隔匹配，元组和特定的类型。switch中匹配的值还能绑定到临时的常量和变量上供情况中代码使用，并且可以为每一个情况写 where 分句表达式来因公复杂条件匹配
 */



//MARK:--------------------------- 1 for-in 循环

/**
 使用 for-in 循环来遍历序列，比如一个范围的数字，数组中的元素或者字符串中的字符
 */

/**
 1. 使用for-in 循环来遍历数组中的元素
 */
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}

/**
 2. 可以遍历字典来访问它的键值对。当字典遍历是，每一个元素都返回一个(key, value)元组，你可以在 for-in 循环体中使用显示命名常量来分解(key, value)元组成员。这是，字典的键就分解到了叫做 animalName 的常量中，而字典的值被分解到了legCount 的常量中：
 */

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

/**
 3. for-in 循环同样能遍历数字区间
 */

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
/* 在上面的例子当中， index 是一个常量，它的值在每次遍历循环开始的时候被自动地设置。因此，它不需要再使用之前声明。它隐式地在循环的声明中声明了，不需要再用 let 声明关键字 */


/**
 4. 如果你不需要序列的每一个只，你可以使用下划线来取代遍历名以忽略值
 */
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")


let minutes = 60
for tickMark in 0..<minutes {
    print("tickMark is \(tickMark)")
}

/**
 5. 可以使用 stride(from:to:by:) 函数来跳过不想要的标记
 */

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("tickMark is \(tickMark)")
}



//MARK:--------------------------- 2 While 循环

/**
 while 循环执行一个合集的语句指导条件变成 false。 这种循环最好在第一次循环之后还有未知数量的遍历时使用。swift提供了两种while 循环：
 1. while 在每次循环开始的时候计算它自己的条件
 2. repeat-while 在每次循环结束的时候计算它自己的条件
 */

//MARK:---------- 2.1 While

/**
 while 循环通过判断单一的条件开始。如果条件为 true， 语句的合集就会重复执行知道条件为 false。通用的书写格式如下：
 */
//while condition {
//    statements
//}


let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
//while square < finalSquare {
//    diceRoll += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    }
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}
//print("Game over!")


//MARK:---------- 2.2 Repeat-While

/**
 while 循环的另一种形式，就是所谓的 repeat-while 循环， 在判断循环条件之前会执行一次循环代码块。然后会继续重复循环知道条件为false。通用的书写形式如下：
 */
//FIXME:swift 的 repeat-while 循环是与其他语言中的 do-while 循环类似的

//repeat {
//    statements
//}while condition

repeat {
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
} while square < finalSquare

print("Game over!")



//MARK:--------------------------- 3 条件语句

/**
 swift 提供了两种方法来给你的代码添加条件分支，就是if语句和 switch 语句。总的来说，你可以使用 if 语句来判定简单的条件， switch 语句则适合更复杂的条件
 */


//MARK:---------- 3.1 if

/* 1.if 语句有着一个单一的if 条件。 它只会在条件为true 的情况下才会执行语句的集合 */
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
}

/* 2.if 常常配合 else 使用 */
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else {
    print("It's not that cold. Wear a t-shirt")
}

/* 3. 同样可以链接多个if 语句 */
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold Consider wearing a scarf")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm . Don't forget to wear sunscreen")
} else {
    print("It's not that cold. Wear a t-shirt")
}

/* 4. 上面的例子中 else 分句是可选的 */
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}


//MARK:---------- 3.2 Switch

/**
 switch 语句会将一个值与多个可能的模式匹配。然后基于第一个成功匹配的模式来执行合适的代码块。一般的书写格式如下：
 */
/*
switch some value to consider {
    case value 1:
    respond to value 1
    case value 2:
    case value 3:
    respond to  value 2 or 3
    default:
    otherwise , do something else
}
 */

/**
 1. 每一个switch 语句都由多个可能的情况组成，每一个情况都以case 关键字开始。
 2. 每一个switch 情况函数体都是独立的代码执行分支，与 if 语句的分支差不多。
 3. switch 语句一定是全面的
 */

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

//MARK:3.2.1 没有隐式贯穿
/**
  相比 C和Objective-C 里的 switch 语句来说，swift 里的switch 语句不会默认从每个情况的末尾贯穿到下一个情况里。相反，整个switch语句会在匹配到第一个 switch 情况执行完毕之后推出，不在需要显示的break 语句。这使得 switch 语句比C的更安全和易用，并且避免了意外地执行多个 switch 情况
 */

//FIXME:尽管 break 在swift 里不是必须的，你仍然可以使用 break 语句来匹配和忽略特定的情况，或者在某个情况执行完成之前就打断他。

/**
 1. 每一个情况的函数体必须包含至少一个可执行的语句。下面的代码就是不正确的，因为第一个情况是空的：
 */

let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}

/**
 从上面的例子中可以看出：与C中的switch语句不通，这个switch 语句没有同事匹配 "a"和"A"。相反他会导致一个编译时错误 case "a":没有包含任何可执行语句。这，可以避免意外地从一个情况贯穿到另一个情况中，并且让代码更加安全和易读。
 */

/**
 2. 在一个 switch 情况中匹配多个值可以用逗号分隔，并且可以写成多行，如果列表太长的话：
 */
let anotherCharacter1:Character = "a"
switch anotherCharacter1 {
case "a", "A":
    print("The letter A")
    break
default:
    print("Not the letter A")
}

//FIXME:要在特定的 switch 情况中使用贯穿行为，使用fallthrough 关键字


//MARK:3.2.2 区间匹配
/**
 switch 情况的值可以在一个区间中匹配。这个例子使用了数字区间来为语言中的数字区间进行转换
 */

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings) .")


//MARK:3.2.3 元组
/**
 你可以使用元组来在一个switch 语句中测试多个值。每个元组中的元素都可以与不同的值或者区间进行匹配。另外，使用下划线（_）来表明匹配所有可能的值
 */

let somePoint = (0, 0)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

/**
 与C不同，swift允许多个switch 情况来判断相同的值。事实上，坐标（0， 0）可能匹配这个例子中所有四个情况，第一个匹配到的情况会被使用。坐标（0，0）将会最先匹配 case(0,0),所以接下来的所有在匹配到的情况将被忽略
 */


//MARK:3.2.4 值绑定
/**
 switch 情况可以将匹配到的中临时绑定为一个常量或者变量，来给情况的函数体使用。这就是所谓的值绑定，因为值是在情况的函数体里 “绑定” 到临时的常量或者变量的
 */
let anotherPoint1 = (2, 0)
switch anotherPoint1 {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y)")
}

/**
 上边的例子中，x 和 y 被 let 关键字声明为常量，因为他们没有必要再情况体内被修改。总之，他们也可以用变量来声明，使用var 关键字。如果这么做，临时的变量就会以合适的值来创建并初始化。对这个变量的任何改变都只会在情况函数体内有效
 */

//MARK:3.2.5 Where

/* switch 情况可以使用 where 分句来检查额外的情况 */

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


//MARK:3.2.6 复合情况

/**
 1. 多个 switch 共享同一函数体的多个情况可以在 case 后写多个模式来复合，在每个模式之间用逗号分隔。如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。如果模式太长，可以把它们写成多行，例如：
 */

let someCharacter1: Character = "e"
switch someCharacter1 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter1) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter1) is a consonant")
default:
    print("\(someCharacter1) is not a vowel or a consonant")
}

/**
 2. 复合情况同样可以包含值绑定。所有复合情况的模式都必须包含相同的值绑定集合，并且复合情况中的每一个绑定都得有相同的类型格式。这才能确保无论复合情况的哪部分匹配了，接下来的函数体重的代码都能访问到绑定的值并且值的类型也都相同
 */

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}



//MARK:--------------------------- 4 控制转移语句

/**
  控制转移语句在你代码执行期间改变代码的执行顺序，通过从一段代码转移控制到另一段。swift 拥有五种控制转移语句：
 1. continue
 2. break
 3. fallthrough
 4. return
 5 throw
 */

//MARK:---------- 4.1 Continue

/**
 continue 语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。它是说“我不再继续当前的循环遍历了” 而是离开整个的循环
 */

//FIXME:在一个包含条件和自增器的 for 循环中，循环的自增器仍然会在调用 continue 语句后评定。循环自身还是会和往常一样工作；只有循环体重的代码被跳过。

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for characters in puzzleInput {
    if charactersToRemove.contains(characters) {
        continue
    } else {
        puzzleOutput.append(characters)
    }
}
print(puzzleOutput)



//MARK:---------- 4.2 Break

/**
 break 语句会立即结束真个控制流语句。当你想要提前结束 switch 或者循环语句或者其他情况是可以在switch 语句或者循环语句中使用 break
 */

//MARK:4.2.1 循环语句中的 Break
/**
 当在循环语句中使用时， break 会立即结束循环的执行，并且转移控制到循环结束花括号 （}）后的第一行代码上。当前遍历循环里的其他代码都不会被执行，并且余下的遍历循环也不会开始了
 */

//MARK:4.2.2 Switch 语句里的 Break
/**
 当 在switch 语句里使用时，break 导致 switch 语句立即结束他的执行，并且转移控制到 switch 语句结束花括号（}）之后的第一行代码上。
 */

let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possibleIntegerValue = 1
case "2", "二":
    possibleIntegerValue = 2
case "3", "三":
    possibleIntegerValue = 3
case "4", "四":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


//MARK:---------- 4.3 Fallthrough
/**
 swift 中switch 语句不会从每个情况的末尾贯穿到下一个情况中。相反，整个switch 语句会在第一个匹配到的情况执行完毕之后就直接结束执行。比较而言，C中，你在每个switch 情况末尾查出显式的 break 语句来阻止贯穿。避免默认贯穿意味着 swift 的 switch 语句比C 更加清晰和可预料，并且因此他们避免了意外执行多个 switch 情况。
 */

/* 可以使用 fallthrougn 关键字来实现贯穿行为 */

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough
case 6:
    description += " nidayede"
default:
    description += " an integer"
}

print(description)

//FIXME:fallthrough 关键字不会为 switch情况检查贯穿情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况


//MARK:---------- 4.4 给语句打标签
/**
 1. 在一个条件语句中，你可以使用一个语句标签配合 break 语句来结束被标记的语句
 2. 在循环语句中，你可以使用语句标签配合 break 或者 continue 语句来结束或者继续执行被标记的语句
 */

/**
 label name: while condition {
     statements
 }
 */


//let finalSquare1 = 25
//var board1 = [Int](repeating: 0, count: finalSquare1 + 1)
//board1[03] = +08; board1[06] = +11; board1[09] = +09; board1[10] = +02
//board1[14] = -10; board1[19] = -11; board1[22] = -02; board1[24] = -08
//var square1 = 0
//var diceRoll11 = 0
//
//gameLoop: while square1 != finalSquare1 {
//    diceRoll11 += 1
//    if diceRoll == 7 {
//        diceRoll = 1
//    }
//    switch square1 + diceRoll11 {
//    case finalSquare1:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare1:
//    continue gameLoop
//    default:
//    square1 += diceRoll11
//    square1 += board1[square1]
//    }
//}
//print("Game over!")



//MARK:--------------------------- 5 提前退出

/**
 guard 语句，类似于 if 语句，基于布尔值表达式来执行语句。使用guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。与if 语句不通， guard 语句总是有一个 else 分句 -------- else 分句里的代码会在条件不为真的时候执行
 */

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}


greet(person: ["name": "John"])

greet(person: ["name": "Jane", "location": "Cupertino"])



//MARK:--------------------------- 6 检查API的可用性
/**
 swift 拥有内置的对API可用性的检查工呢个，他能够确保你不会悲剧地使用了对部属目标不可用的API
 */

//FIXME:你可以在 if 或者 guard 语句中使用一个可用性条件来有条件地执行代码，基于在运行时你想用的哪个API是可用的。当验证在代码块中的API可用性时，编译器使用来自可用性条件里的信息来检查

if #available(iOS 10, macOS 10.12, *){
    
} else {
    
}
