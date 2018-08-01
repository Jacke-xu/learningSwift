//
//  main.swift
//  swift4.2(类和结构体)
//
//  Created by 范云飞 on 2018/7/25.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:----------------------------- 类和结构体 -------------------------------------

/**
 1. 作为你程序代码的构建基础，类和结构体是一种多功能且灵活的构造体。通过使用与现存常量、变量、函数完全相同的语法来和结构体当中定义属性和方法以添加功能
 2. 不想其他的程序语言，swift 不需要你为自定义类和结构体创建独立的接口和实现文件。在swift中，你在一个文件中定义一个类或者结构体，则系统将会自动生成面向其他代码的外部接口
 */

//FIXME:一个类的实例通常被称为对象。总之，swift的类和结构体在功能上要比其他语言中的更加接近，并且本章节缩讨论的大部分功能都可以同时用在类和结构体的实例上。



//MARK:-------------------------- 1 类与结构体的对比

/**
 在swift 中类和结构体有很多共同之处：
 1. 定义属性用来存储值
 2. 定义方法用于提供功能
 3. 定义下标脚本用来允许使用下标语法访问值
 4. 定义初始化器用于初始化状态
 5. 可以被扩展来默认所没有的功能
 6. 遵循协议来针对特定类型提供标准功能
 
 类有而结构体没有的额外功能：
 1. 继承允许一个类继承另一个类的特征
 2. 类型转换允许你在运行检查和解释一个类实例的类型
 3. 反初始化器允许一个类实例释放任何其所被分配的资源
 4. 引用计数允许不止一个对类实例的引用
 */

//FIXME:结构体在你的代码中通过赋值来传递，并且并不会使用引用计数



//MARK:1.1 定义语法

/**
 类与结构体有着相似的定义语法，你可以通过使用关键字 class 来定义类使用 struct 来定义结构体。并在一对大括号内定义它们的具体内容
 */

class SomeClass {
    
}

struct SomeStructure {
    
}

//FIXME:无论你在何时定义了一个新的类或者结构体，实际上你定义了一个全新的swift类型。请用 UpperCameCase命名法(比如这里我们说到的SomeClass 和SomeStructure)以符合Swift的字母大写风格。相反，对于属性和方法使用 lowerCamelCase命名法(比如 frameRate 和 incrementCount)，以此来区别类型名称

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


//MARK:1.2 类与结构体实例

/**
 Resolution 结构体的定义和 VideoMode 类的定义仅仅描述了什么是Resolution 或 VideoMode。 它们自己并没有描述一个特定的分辨率或视频模式。对此，你需要创建一个结构体或类的实例
 */

let someResolution = Resolution()
let someVideoMode = VideoMode()
/* 上面的例子创建了一个新的类或者结构体的实例，任何属性都被初始化为它们的默认值。 */


//MARK:1.3 访问属性

/**
 1. 你可以用点语法访问一个实例的属性。在点语法中，你只需在实例名后面书写属性名，用（.）来分开，无序空格
 */

print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

/**
 2. 你可以用点语法来置顶一个新值到一个变量属性中：
 */
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

//FIXME:不同于Objective-C，Swift允许你直接设置一个结构体属性中的子属性。在上述最后一个例子中，someVideoModel的 resolution 属性中的width 这个属性可以直接设置，不用你重新设置整个 resolution 属性到一个新值


//MARK:1.4 结构体类型成员初始化器
/**
 所有的结构体都有一个自动生成的成员初始化区，你可以使用它来初始化新结构体实例的成员属性。新实例属性的初始化值可以通过属性名称传递到成员初始化器中
 */

let vga = Resolution(width: 640, height: 480)



//MARK:-------------------------- 2 结构体和枚举是值类型

/**
 1.值类型是一种当他被置顶到常量或者变量，或者被传递给函数是会被拷贝的类型
 2.Swift 中所有的基本类型----------------整数、浮点数、布尔量、字符串、数组和字典等都是值类型，并且都以结构体的形式在后台实现
 3.swift 中所有的结构体和枚举都是值类型型，这意味着你所创建的任何结构体和枚举实例------------和实例作为属性所包含的任意值类型---------在代码传递中总是被拷贝的
 */

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
/**
 这个例子声明了一个叫 hd 的常量，并且赋予它一个以全高清视频宽和搞初始化的Resolution 实例， 之后声明了一个叫 cinema 的变量并且以当前hd 的值进行初始化。因为Resolution 是一个结构体，现有实例的拷贝会被制作出来，然后这份新的拷贝就赋值给了cinema。尽管hd 和cinema有相同的像素宽和像素高，但是在后台中它们是两个完全不同的实例
 */

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

/**
 当cinema 被赋予hd 的当前值，存储在hd 中的值就被拷贝给了新的cinema实例。这最终的结果是两个完全不同的实例，它们只是碰巧包含了相同数字值。由于它们是完全不同的实例，cinema 的宽度被设置2048 并不影响hd 中width 存储的值
 这种行为规则同样适用于枚举：
 */


enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}



//MARK:-------------------------- 3 类是引用类型

/**
 不同于值类型，在引用类型被赋值到一个常量，变量或者本身被传递到一个函数的时候他是不会被拷贝的。相对于拷贝，这里使用的是同一个对现存实例的引用
 */

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

/* 因为类是应用类型， tenEighty 和 alsoTenEighty 其实都是引用了相同的VideoMode实例。实际上，它们只是相同实例的两个不同命名罢了 */

print("the frameRate property of tenEighty is now \(tenEighty.frameRate)")

/**
 注意 tenEighty 和 alsoTenEighty 都被声明为常量。然而，你仍然能改变 tenEighty.frameRate和alsoTenEighty。frameRate 因为 tenEighty和 alsoTenEighty 常量本身的值不会改变。tenEighty 和 alsoTenEighty 本身是并没有存储 VideoMode 实例 ----相反，它们两者都在后台指向了 VideoMode 实例。这是VideoMode 的frameRate 参数在改变而不是VideoMode的常量的值在改变
 */


//MARK:3.1 特征运算符

/**
 有时候找出两个常量或者变量是否引用自同一个类实例非常有用，为了允许这样，swift提供了两个特点运算符：
     相同于 （===）
     不相同于 （！==）
 利用这两个恒等运算符来检查两个常量或者变量是否引用相同的实例
 */

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}

//FIXME: "相同于" 意味着两个类类型常量或者变量引用自相同的实例， "等于" 意味着两个实例在值上被视作 "相等"或者 "等价"，某种意义上的"相等"，就如同类设计者定义的那个样

/**
 当你定义了你自己的自定义类和结构体，你有义务来判定两个实例 "相等"的标准。这个定义在你自己的 "等于" 和 "不等于" 实现的过程
 */


//MARK:3.2 指针

/**
 如果你有过C、C++、Objective-C的经验，你可能知道这些语言使用指针来引用内存中的地址。一个swift 的常量或者变量只想某个实例的引用类型和C中的指针类似，但是这并不是直接指向内存地址的指针，也不需要你书写星号 （*）来明确你建立了一个引用。相反，这些引用被定义的就像swift中其他常量或者变量一样
 */



//MARK:-------------------------- 4 类和结构体之间的选择

/**
 结构体实例总是通过值来传递，而类实例总是通过引用来传递。这意味着它们分别使用于不同类型的任务
 
 当符合以下一条或者多条情形时应考虑创建一个结构体：
   * 结构体的主要目的是为了封装一些相关的简单数据值
   * 当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用
   * 任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用
   * 结构体不需要从一个已存在类型集成属性或者行为
 
 在其他的情况下，定义一个类，并创建这个类的实例通过引用来管理和传递。事实上，大部分的自定义数据结构应该是类，而不是结构体
 */



//MARK:-------------------------- 5 字符串，数组和字典的赋值与拷贝行为

/**
 1.swift 的 String ，Array 和 Dictionary 类型是作为结构体来实现的，这意味着字符串，数组和字典在它们被赋值到一个新的常量或者变量，亦或者它们本身被传递到一个函数或方法中的时候，其实是传递了拷贝
 2. 这种行为不同于基础库中的NSString, NSArray 和 NSDictionary,它们是作为类来实现的，而不是结构体。NSString ,NSArray 和 NSDictionary 实例总是作为一个一寸实例的引用而不是拷贝来赋值和传递的
 */
