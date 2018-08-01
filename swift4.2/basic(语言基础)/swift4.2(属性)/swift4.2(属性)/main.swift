//
//  main.swift
//  swift4.2(属性)
//
//  Created by 范云飞 on 2018/7/26.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:--------------------------------- 属性 --------------------------------


/**
 属性可以将值与特定的类、结构退、枚举联系起来：
 1. 存储属性会存储常量或变量作为实例的一部分，只能有类和结构体定义
 2. 计算属性会计算值，计算属性可以由类、结构体、枚举定义
 
 存储属性和计算属性通常和特定类型的实例相关联。比如说：当属性与类型本身相关联时，这种属性就是所谓的类型属性
 
 你也可以定义属性观察器来检查属性中值的变化
 */


//MARK:-------------------------- 1 存储属性

/**
 1. 最简单的形式：存储属性是一个作为特定类和结构体实例一部分的常量或变量
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}


var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
/* FixedLengthRange 的实例有一个名为 firstValue 的变量存储属性和一个名为 length 的常量存储属性。在上面的例子中，当新的值域创建时 length 已经被创建并且不能再修改，因为这是一个常量属性。 */


//MARK:1.1 常量结构体实例的存储属性
/**
 如果你创建了一个结构体的实例并且把这个实例赋给常量，你不能修改这个实例的属性，即使是声明为变量的属性：
 */

//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6

/**
 1. 这是由于结构体是值类型。当一个值类型的实例被标记为常量是，该实例的其他属性也均为常量
 2. 对于类来说则不同，他是引用类型。如果你给一个常量赋值引用类型实例，你仍然可以修改那个实例变量属性
 */


//MARK:1.2 延迟存储属性

/**
 延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰语来表示一个延迟存储属性
 */

//FIXME:必须把延迟存储属性声明为变量（使用var关键字），因为它的初始值可能在实例初始化完成之前无法取得。常见属性则必须在初始化完成之前有值，因此不能声明为延迟

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

/**
 DataManager 的功能之一是从文件导入数据。此功能由 DataImporter 类提供，它假定为需要一定时间来进行初始化。这是因为 DataImporter 实例在进行初始化的时候需要打开文件并读取其内容到内存中
 DataManager 本身创建的时候没有必要去在创建一个新的 DataImporter实例。在DataImporter 第一次被使用的时候在创建它才更有意义
 */

print(manager.importer.fileName)

//FIXME:如果被标记为 lazy 修饰符的属性同时被多个线程访问并且属性还没有被初始化，则无法保证属性只初始化一次


//MARK:1.3 存储属性与实例变量

/**
 
 */



//MARK:-------------------------- 2 计算属性

/**
 除了存储属性，类、结构体、枚举也能够定义计算属性，而它实际并不存储值。相反，他们提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值
 */

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y)")



//MARK:2.1 简写设置器（setter） 声明

/**
 如果一个计算属性的设置器没有为将要被设置的值定义一个名字，那么他将被默认命名为  newValue.
 */

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


//MARK:2.2 只读计算属性

/**
 一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个值
 */

//FIXME:你必须用 var 关键字定义计算属性-------包括只读计算属性-----------为变量属性，因为他们的值不是固定的。 let 关键字只用于常量属性，用于明确那些值一旦作为实例初始化就不能修改

struct Cuboid {
    var width = 0.0 , height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")



//MARK:-------------------------- 3 属性观察者

/**
 属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同
 除了延迟存储属性。你可以为你定义的任意存储属性添加属性观察者
 */


class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

class StepCounterSub: StepCounter {
//    var overrideTotalSteps: Int = 0 {
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps)")
//        }
//        didSet {
//            if overrideTotalSteps > oldValue {
//                print("Added \(overrideTotalSteps - oldValue) steps")
//            }
//        }
//    }
}

let stepCounter = StepCounterSub()
stepCounter.totalSteps = 200


//FIXME:父类属性的 willSet 和 didSet 观察者会在子类初始化器中设置被调用。



//MARK:-------------------------- 4 全局和局部变量

/**
 上面的描述的计算属性和观察属性的能力同样对全局变量和局部变量有效
 1. 全局变量是定义在任何函数、方法、闭包、类环境之外的变量
 2. 局部变量是定义在函数、方法、闭包环境之中的变量
 */

//FIXME:全局变量和常量永远是延迟计算的，不同于延迟存储属性，全局变量和常量不需要标记lazy修饰符



//MARK:-------------------------- 5 类型属性

/**
 你可以定义属于类型本身的属性，不是这个类型的某一个实例的属性。这个属性只有一个拷贝，无论你创建了多少个类对应的实例。这样的属性叫做类型属性。
 */


//MARK:5.1 类型属性语法

/**
 下面的例子展示了存储和计算类型属性的语法：
 */

struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}


//MARK:5.2 查询和设置类型属性

/**
 类型属性使用点语法来查询和设置，与实例属性一致
 */

print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)



struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

//FIXME:在这两个检查中，didSet 观察者设置 cuurentLevel 为不同的值。

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

