//
//  main.swift
//  swift4.2(基础内容)
//
//  Created by 范云飞 on 2018/7/20.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:-------------------------------------------基础内容-------------------------------------------

//MARK:swift特点

/**
 相较于objective-C
 1.增加了元组，元组允许你来创建和传递一组数据，可以利用元组在一个函数中以单个复合值的形式返回多个值
 2.增加了可选项，用来处理没有值的情况，可选项意味着要么有值要么没有值（类似于objective-C中的nil指针），可选项也可以用在所有的类型上，比OC中的nil指针更加的安全、易读
   swift帮助你明确代码可以操作值的类型，如果你的一段代码预期的得到一个 String，类型会安全地组织你不小心传入Int。在开发中，这个限制能帮助你在开发过程中更早地发现并修复错误
 */


//MARK:-------------------- 1 常量和变量

//MARK:1.1 声明常量和变量

/**
 1.常量和变量必须在使用前被声明，使用关键子let来声明常量，使用关键字var 来声明变量
 2.在你的代码中，如果存储的值不会改变，请用let 关键字将之声明为一个常量。只有存储会改变的值是才能使用变量
 */

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
currentLoginAttempt = 20
print(currentLoginAttempt)

/**
 在这个例子中，登录次数允许的最大值被声明为一个常量，因为最大值永远不会更改。当前尝试登录的次数被声明为一个变量，因为这个值在每次登录尝试失败后会递增
 */



//MARK:1.2 类型标注

/**
 你可以在声明一个变量或者常量的时候提供类型标注，来明确变量或者常量能够存储值的类型。添加类型标注的方法是在变量或者常量的名字后面加上一个冒号，再跟一个空格，最后加上要使用的类型名称
 */

var welcmMessage: String /* 声明一个叫做 welcomeMessage 的变量，他的类型是String */
var red, green, blue: Double
welcmMessage = "qunidade"
print(welcmMessage)

/**
 1.我们说 “类型是String” 就意味着可以存储任何String 值。也可以理解为这类东西或者这种东西 可以被存储进去
 2.实际上，你并不需要经常使用类型标注。如果你在定义一个常量或者变量的时候就给他设定一个初始值，那么swift就想 类型安全和类型推断中描述的那样，几乎都可以推断出这个常量或者变量的类型。在上面welcomeMessage的例子中，没有提供初始值，所以welcomeMessage 这个变量使用了类型标注来明确他的类型而不是通过初始值的类型推断出来的
 */


//MARK:1.3 命名常量和变量

/**
 常量和变量的名字几乎可以使用任何字符，甚至包括Unicode字符
 */

let π = 3.14159
let 你好 = "你好世界"
let ？？ = "dogcow"

/**
 1.常量和变量的名字不能包含空白字符、数字符号、箭头、保留（或者无效的）Unicode码位、连线和制表符。也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方
 2.一旦你声明了一个确定类型常量或者变量，就不能使用相同的名字再次进行声明，也不能让他改存其他类型的值。常量和变量之间也不能互换
 */

var friendlyWelcome = "Hello:"
friendlyWelcome = "bonjour"



//MARK:1.4 输出常量和变量

print(friendlyWelcome)

/**
 swift 使用字符串插值的方式来把常量名或者变量名当做占位符加入到更长的字符串中，然后让swift用常量或者变量的当前值换这些占位符。将常量或者变量名放入圆括号中并在括号前使用
 */

print("the current value of friendlyWelcome is \(friendlyWelcome)")


//MARK:-------------------- 2 注释

/**
 1.单行注释 使用 ‘//’
 2.多行注释 使用 ‘/* 内容 */’
 */


//MARK:-------------------- 3 分号

/**
 和许多其他语言不同， swift并不要求你在每一句代码结尾写分号（;）,当然如果你想写的话也没有问题，总之，如果你想在一行里写多句代码，分号还是需要的
 */

let cat = "?"; print(cat)



//MARK:-------------------- 4 整数

/**
 swift 提供了8，16，32，64位编码的有符号和无符号整数，这些整数类型的命名方式和C相似，例如8位无符号整数的类型是UInt8。与swift中的其他类型相同，这些整数类型也用开发大写命名法
 */


//MARK:4.1 整数范围

/**
 你可以通过min和max 属性来访问每个整数类型的最小值和最大值
 */

let minValue = UInt8.min /* 最小值是0，值的类型是UInt8 */
let maxValue = UInt8.max /* 最大值是255， 值的类型是UInt8 */



//MARK:4.2 Int

/**
 在大多数情况下，你不需要在你的代码中为整数设置一个特定的长度。swift提供了一个额外的整数类型：Int，它拥有与当前平台的原生子相同的长度
 1.在32位平台上，Int的长度和 Int32相同
 2.在64位平台上，Int的长度和 Int64相同
 
 除非你需要操作特定长度的整数，否则请尽量在代码中使用Int 作为你的整数的值类型
 */


//MARK:4.3 UInt

/**
 swift 也提供了一种无符号的整数类型， UInt，它和当前平台的原生字长度相同
 1. 在32位平台上，UInt长度和UInt32长度相同
 2. 在63位平台上，UInt长度和UInt64长度相同
 */


/**
 只在的确需要存储一个和当前平台原生字长度相同的无符号整数的时候才使用UInt。其他情况下，推荐使用Int， 即使已经知道存储的值都是非负的。如同 类型安全和类型推断 中描述的那样，统一使用Int 会提高代码兼容性，同时可以避免不同数字类型之间的转换问题，也符合整数的类型推断
 */



//MARK:-------------------- 5 浮点数

/**
 1.浮点数是有小数的数字，浮点数相比整数类型来说能表示更大范围的值，可以存储比Int 类型更大或者更小的数字。
 2. swift提供了两种有符号的浮点数类型
     Double 代表64位的浮点数（Double 有至少15位数字的精度，而Float 精度只有6位，具使用哪种浮点类型取决你代码需要处理的值范围，在两种类型都可以的情况，推荐使用Double类型）
     Float  代表32位的浮点数
 */



//MARK:-------------------- 6 类型安全和类型推断

/**
 swift 是一门类型安全的语言，类型安全的语言可以让你清楚地知道可以处理的值的类型。如果你的一部分代码期望获得String，你就不能错误的传给他一个Int
 */

let meaningOfLife = 42 /* swift会推断这个常量的类型是Int */
let pi = 3.14159       /* swift会推断这个常量的类型是Double类型 */

let anotherPi = 3 + 0.14159 /* swift会推断这个常量的类型是Double类型 */




//MARK:-------------------- 7 数值型字面量

/**
 整数型字面量可以写作：
 1.一个十进制数，没有前缀
 2.一个二进制数，前缀是0b
 3.一个八进制数，前缀是0o
 4.一个十六进制数，前缀是0x
 */

let decimalInteger = 17
let binaryInteger = 0b10001 // 17
let octalInteger = 0o21 // 17
let hexadecimalInteger = 0x11 // 17

/**
 浮点字面量：可以是十进制或者是十六进制（前缀是0x），小数点两边必须有至少一个十进制数字（或者十六进制的数字）。十进制的浮点字面量还有一个可选的指数 E/e表示, 十六进制的浮点字面量必须有指数，P/p表示
 1.25e2 ：意味着1.25 x 10的2次方 或者 125.0
 0xFp2 : 意味着15 x 2的-2次方 或者 3.75
 
 */

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

/**
 数值型字面量也可以增加额外的格式是代码更加易读，整数和浮点数都可以添加额外的0或者下划线来增加代码的可读性
 */


let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1



//MARK:-------------------- 8 数值类型转换

/**
 1.通常来讲，即使我们知道代码中的整数变量和常量是非负的，我们也会使用Int类型
 2.只有在特殊情况下才会使用整数的其他类型，例如需要处理外部长度明确的数据或者为了优化性能、内存占用等其他必要情况
 */

//MARK:8.1 整数转换

/**
 不同整数的类型在变量和常量中存储的数字范围是不同的，如果数字超出了常量或者变量可存储的范围，编译的时候就会报错,如下面的例子：
 */

//let cannotBeNegative:UInt8 = -1

/**
 因为每个数值类型可存储的值的范围不同，你必须根据不同的情况进行数值类型的转换。这种选择性使用的方式可以避免隐式转换的错误并使你代码中的类型转换意图更加的清晰。
 例如：
     要将一种数字类型转换成另外一种类型，你需要用当前值来初始化一个期望值的类型。
 */

let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let towThousandAndOne = twoThousand + UInt16(one)

/**
 上面的例子中，常量twoThousand 的类型是UInt16， 而常量one 的类型是UInt8。他们不能直接被相加在一起，应为他们的类型不同，所以，这里让UInt16（one） 创建一个新的UInt16类型并用 one 的值初始化，这样就可以在原来的地方使用了
 
 
 SomeType(ofInitialValue) 是调用swift 类型初始化器并传入一个初始值的默认方法。在语言的内部，UInt16 有一个初始化器，可以接受一个UInt8 类型的值，所以这个初始化器可以用现有的 UInt8 来创建一个新的 UInt16 。这里需要注意的是并不能传入任意类型的值，只能传入UInt16 内部有对应初始化器的值。不过你可以扩展现有的类型来让它可以接收其他类型的值（包括自定义类型）
 */


//MARK:8.2 整数和浮点数转换

/**
 1.整数和浮点数类型转换必须显式地指定类型，例如：
 */

let three = 3
let pointOneFourOneFiveNine = 0.14159
let p = Double(three) + pointOneFourOneFiveNine

/**
 在上面的例子中，常量three 的值被用来创建一个类型为Double 的新的值，所以加号两边的值的类型是相同的。没有这个转换，加法就无法进行
 */

/**
 2. 浮点转换为整数也必须显式地指定类型。一个整数类型可以用一个Double 或者Float 值初始化
 */

let integerPi = Int(p);/* 在用浮点数初始化一个新的整数类型的时候，数值会被截断。也就是说4.75 会变成4， -3.9 会变成 -3 */

//FIXME:结合数字常量和变量的规则与结合数字字面量的规则不同，字面量 3 可以直接和字面量0.14159 相加，因为数字字面量本身没有明确的类型，他们的类型只有在编译器需要计算的时候才会被推测出来



//MARK:-------------------- 9 类型别名

/**
 类型别名可以为已经存在的类型定义了一个新的可选名字，用 typealias 关键字定义类型别名
 */

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
print(maxAmplitudeFound)

/**
 在上面的例子中，AudioSample 就是UInt16 的别名，因为这个别名的存在，我调用AudioSample.min 其实就是在调用 Int16.min， 在这里变量 maxAmplitudeFound 被提供了一个初始值 0
 */



//MARK:-------------------- 10 布尔值

/**
 swift 有一个基础的布尔量类型，就是Bool， 布尔量被作为逻辑值来引用，因为它的值只能是真或者假，swift为布尔量提供了两个常量值，true 和false
 */

let orangesAreOrange = true
let turnipsAreDelicious = false

/**
 上面的两个类型 orangesAreOrange 和 turnipsAreDelicious 被推断为 Bool， 因为他们使用布尔量来初始化。
 */

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
} else {
    print("eww, turnips are hoorible")
}

/* swift的类型安全机制会组织你用一个非布尔量的值替换掉 Bool， 例如： */

//let i = 1
//if i {
//
//}



//MARK:-------------------- 11 元组

//FIXME:元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。

let http404Error = (404, "Not Found")

/**
 1.(404, "Not Found") 元组把一个Int 和 一个 String 组合起来表示 HTTP状态代码的两种不同的值：数字和人类可读的描述。它可以被描述为“一个类型为（Int, String）的元组”
 2. 实际上，任何类型的组合都是可以的
 3. 你也可以讲一个元组的内容分解成单独的常量或者变量，这样你就可以正常的使用它们了，例子如下：
 */

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

/**
 4. 当你分解元组的时候，如果只需要使用其中的一部分数据，不需要的数据可以用下滑线 ‘_’ 代替：
 */

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

/**
 5. 也可以利用从零开始的索引数字访问元组中的单独元素：
 */

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

/**
 6. 你可以在定义元组的时候给其中的单个元素命名：
 */

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


/**
 7. 作为函数返回值时，元组非常有用，一个用来获取网页的函数可能会返回一个 (Int, String) 元组来描述是否获取成功。相比只能返回一个类型的值，元组能包含两个不同类型值，他可以让函数的返回信息更有用。
 */

//FIXME:元组在临时的值组合中很有用，但是他们不适合创建复杂的数据结构，如果你的数据结构超出了临时使用的范围，那么请建立一个类或者结构体来代替元组



//MARK:-------------------- 12 可选项

/**
 可以利用可选项来处理值可能确实的情况。可选项意味着：（一个值，它可能等于X 或者 这里根本没有值）
 */

//FIXME:在C和Objective-C中，没有可选项的概念。在Objective-C中有一个近似的特性，一个方法可以返回一个对象或者返回 nil。 nil的意思是 “缺少一个可用对象”，他只能用在对象上，却不能作用在结构体，基础的C类型和枚举值上。然而， swift中的可选项就可以让你知道任何类型的值的确实，他并不需要一个特殊的值

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

/**
 上面的例子中，初始化器可能会失败，所以他会返回一个可选的 Int，而不是 Int。 可选的 Int 应该写成 Int?,而不是Int。 问号明确了他存储的值是一个可选项，意思就是说他可能包含某些 Int值，或者 可能根本不包含值。（他不能包含其他的值，例如 Bool值 或者 String 值，他要么是 Int 要么什么都没有）
 */


//MARK:12.1 nil

/**
 你可以通过给可选变量赋值一个 nil 来将之设置为没有值，例如：
 */
var serverResponseCode: Int? = 404

serverResponseCode = nil

//FIXME:nil 不能用于非可选的常量或者变量（如下面的例子），如果你的代码中变量或常量需要作用于特定条件下的值缺失，可以给他声明为相应类型的可选项

//var server = "nnn"
//server = nil

//FIXME:swift中的 nil 和Objective-C中的 nil 不同，在Objective-C中 nil 是一个只想不存在对象的指针。在swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型


//MARK:12.2 if 语句以及强制展开

/**
 你可以利用 if语句通过比较 nil 来判断一个可选项中是否包含值。利用相等运算符 “==” 和不等运算符 “!=”
 */
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

/**
 在上面的例子中，一旦你确定可选项中包含值，你可以在可选的名字后面加一个感叹号“！”来获取值，感叹号的意思就是说“我知道这个可选项里面有值，展开吧”，这就是所谓的可选值的强制展开
 */

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

//FIXME:使用 ！来获取一个不存在的可选值会导致运行错误，在使用！强制展开之前必须确保可选项中包含一个非 nil 的值


//MARK:12.3 可选项绑定

/**
 可以使用可选绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量。可选绑定可以与 if 和while 的语句使用来检查可选项内部的值，并赋值给一个变量或常量，具体书写格式如下：
 */

//if let constantName = someOptional {
//    statements
//}


if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

/**
 1. 在上面的例子中： 如果Int(possibleNumber) 返回的可选 Int 包含一个值，将这个可选项中的值赋予一个叫做 actualNumber的新常量
 2. 你可以在同一个if 语句中包含多个可选项绑定，用逗号分隔即可。如果任一可选绑定结果是 nil 或者 布尔值 为false， 那么整个 if 判断会被看作 false。下面的两个if 语句是等价的：
 */

if let firstNumber = Int("4"), let secondeNumber = Int("42"), firstNumber < secondeNumber && secondeNumber < 100 {
    print("\(firstNumber) < \(secondeNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//FIXME:如同  提前退出  中描述的那样，使用if 语句创建的常量和变量值在 if语句的函数体内有效。相反，在guard 语句中创建的常量和变量在 guard 语句后的代码中也可以用


//MARK:12.4 隐式展开可选项

/**
 有时候在一些程序结构中可选项一旦被设定值之后，就会一直拥有值。在这中情况下，就可以去掉检查的需求，也不必每次访问的时候都进行展开，因为他可以安全的确认每次访问的时候都有一个值。这种类型的可选项被定义为隐式展开可选项，通过在声明的类型后边添加一个叹号（String!）而非问好（String?）来书写隐式展开可选项
 */

//FIXME:隐式展开可选项主要被用在swift类的初始化过程中

let possibleString: String? = "an optional string"
let forcedString: String? = possibleString!

if possibleString != nil {
    print(possibleString!)
}

let assumedString: String? = "an implicitly unwrapped optional string"
let implicitString: String! = assumedString!

if implicitString != nil {
    print(implicitString!)
}

//FIXME:如果你在隐式展开可选项没有值的时候还尝试获取值，会导致运行错误，结果和在没有值的普通可选后面加一个叹号一样



//MARK:-------------------- 13 错误处理

/**
 1.在程序执行阶段，你可以使用错误处理机制来为错误状态负责。
 2.相比于可选项的通过值是否缺失来判断程序的执行正确与否，而错误处理机制能允许你判断错误的形成原因，在必要的情况下，害呢将你的代码中的错误传递到程序的其他地方
 */

func canThrowAnError() throws {
    print("抛出错误的方法")
}

/**
 1.当一个函数遇到错误情况，他会抛出一个错误，这函数的访问者会捕捉到这个错误，并作出合适的反应，如同上面的例子
 2.通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预制 try 关键字 ，swift会自动将错误传递到他们的生效范围之外，知道他们被 catch 分句处理,如下面的例子
 */

do {
    try  canThrowAnError()
    // no error was thrown
} catch {
    //an error was thrown
}

/* 在上面的例子中， do 语句创建了一个新的容器范围，可以让错误被传递到不止一个 catch 分句里 */

func makeASandwich() throws {
    
}

//do {
//    try makeASandwich()
//
//} catch Error.OutOfCleanDishes {
//    washDishes()
//} catch Error.MissingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}



//MARK:-------------------- 14 断言和先决条件

/**
 1.断言和先决条件用来检测运行时发生的事情。你可以使用它们来保证在执行后续代码前某必要条件是满足的。如果布尔条件在断言或者先决条件中计算为 true ，代码就正常继续执行。如果条件计算为 false ,那么程序当前的状态就是非法的；代码执行结束，然后你的APP终止。
 2.断言和先决条件的不同之处在于他们什么时候做检查：断言只在debug 构建的时候检查，但先决条件则在debug和生产构建中生效。在生产构建中，断言中的调价不会被计算。这就是说你可以在开发的过程当中随便使用断言而无需担心影响生产性能
 */


//MARK:14.1 使用断言进行调试

/**
 你可以使用全局函数 assert(_:_:)函数来写断言。向assert(_:_:)函数传入一个结果为true 或者false的表达式以及一条会在结果为false 的时候显示的信息：
 */

let age = -3
//assert(age >= 0, "a person's age cannot be less than zero")

/**
 在这个例子当中，代码执行只要在 if age >= 0 评定为 true 是才会继续，就是说，如果 age 的值为负，在上文的代码中，age >= 0 评定为 false, 断言就会被处罚，终止应用
 */

/* 如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:) 函数来表明断言失败，如下面的例子*/
//if age > 10 {
//    print("you can ride the  roller-coaster or the ferris wheel")
//} else if age > 0 {
//    print("you can ride the ferris wheel")
//} else {
//    assertionFailure("a person's age can't be less than zero")
//}



//MARK:14.2 强制先决条件

/**
 1.代码中任何条件可能潜在为假但必须肯定为真才能继续执行的地方使用先决条件
 2.precondition(_:_:file:line:)函数来写先决条件，给这个函数传入表达式计算为 true 或 false, 如果条件的结果是 false 信息就会显示出来，如下面的例子：
 */

func toBool(x:Int) -> Bool {
    precondition(x == 0 || x == 1, "This function can only convert 0 or 1 to Bool")
    if x == 0 {
        return false
    }
    return true
}

print(toBool(x: 1))
print(toBool(x: 0))
//print(toBool(x: 2))
