//
//  main.swift
//  swift4.2(方法)
//
//  Created by 范云飞 on 2018/7/26.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:-------------------------- 方法 ------------------------

/**
 1. 方法是关联了特定类型的函数。类、结构体、枚举都能定义实例方法。方法封装了给定类型特定的任务和功能
 2. 结构体和枚举中定义方法是 swift 语言与 C语言和Objective-C 的主要区别。
 */


//MARK:-------------------------- 1 实例方法

/**
 实例方法是属于特定类实例、结构体实例、或者枚举实例的函数。
 */

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)

counter.increment(by: 5)
print(counter.count)

counter.reset()
print(counter.count)


//MARK: 1.1 self 属性

/**
 1.每一个类的实例都隐含一个叫做self 的属性，他完全与实例本身相等。你可以使用 self 属性来在当前实例当中调动它自身的方法
   在上边的例子中， increment() 方法可以写成这样
 */

//func increment() {
//    self.count += 1
//}

/**
 2. 可以使用 self 属性来区分形式参数名和属性名
 */

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}


//MARK:1.2 在实例方法中修改值类型

/**
 结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改
 你可以选择在 func 关键字前放一个 mutating 关键字来使用这个行为：
 */

struct NewPoint {
    var x = 0.0 , y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var anotherPoint = NewPoint(x: 1.0, y: 1.0)
anotherPoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")


//FIXME: 如同 常量结构体实例的存储属性 里描述的那样，你不能在常量结构体类型里调用异变方法，因为自身属性不能被改变，就算他们是变量属性

//let fixedPoint = NewPoint(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)


//MARK:1.3 在变异方法里指定自身

/**
 1.异变方法可以指定整个实例给隐含的 self 属性。
 */

struct AnotherPoint {
    var x = 0.0 , y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = AnotherPoint(x: deltaX, y: deltaY)
    }
}

/**
 2. 枚举的异变方法可以设置隐含的self 属性为相同枚举里的不同成员：
 */

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var oventLight = TriStateSwitch.low
oventLight.next()

oventLight.next()



//MARK:-------------------------- 2 类型方法

/**
 1.实例方法是特定类型实例找那个调用的方法。你同样可以定义在类型本身调用的方法。这类方法被称作类型方法。
 2.你可以通过在func 关键字之前使用 static 关键字来明确一个类型方法。类同样可以使用class 关键来允许子类重写父类对类型方法的实现
 */

//FIXME:在Objective-C 中，你只能在Objective-C的类中定义类级别的方法。但是在swift 中，你可以在所有的类里面定义类级别的方法，还有结构体和枚举。每一个类方法都能够对他自身的类范围显示生效

class SomeClass {
    class func comeTypeMethod() {
        print("class 关键字")
    }
    
    static func someTypeMethod() {
        print("static 关键字")
    }
}

SomeClass.comeTypeMethod()
SomeClass.someTypeMethod()



struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}


class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}


var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")


player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
