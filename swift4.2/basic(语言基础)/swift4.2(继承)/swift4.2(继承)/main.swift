//
//  main.swift
//  swift4.2(继承)
//
//  Created by 范云飞 on 2018/7/26.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:------------------------- 继承-------------------------

/**
 1. 一个类可以从另一个类继承方法、属性、其他的特征。当一个类从另一个类继承的时候，继承的类就是所谓的子类，而这个类继承的类被称为父类。
 2. 在swift 中类可以调用和访问属于他们父类的方法、属性、下标脚本，并且可以提供他们自己重写的方法，属性和下标脚本本来定义或修改他们的行为。
 3. 类也可以向继承的属性添加属性观察器，以便在属性的值改变是得到通知。可以添加任何熟悉感监视到属性中，不管他是被定义为存储还是计算属性
 */


//MARK:------------------ 1 定义一个基类

/**
 任何不从另一个类继承的类都是所谓的基类
 */


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()
print("Vehicle : \(someVehicle.description)")


//MARK:------------------ 2 子类

/**
 子类是基于现有类创建新类的行为。子类从现有的类继承了一些特征，你可以重新定义他们。你也可以为子类添加新的特征
 */

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")


class Tandem: Bicycle {
    var currentNumberOfPassengrs = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengrs = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")



//MARK:------------------ 3 重写

/**
 1.子类可以提供它自己的实例方法、类型方法、实例属性、类型属性或下标脚本的自定义实现，否则它将会从父类继承。这就是所谓的重写
 2. 重写不是继承的一个特征，你需要在你重写定义前面加上 override 关键字。这样做说明你打算提供一个重写而不是意外提供了一个相同的定义。意外的重写可能导致异响不到的行为，并且任何没有使用 override 关键字的重写都会在编译时被诊断为错误
 3. override 关键字 会执行 swift 编译器检查你重写的类的父类是否有与之匹配的声明来供你重写。
 */


//MARK:3.1 访问父类的方法、属性和下标脚本

/**
  你可以通过使用 super 前缀访问父类的方法、属性或者下标脚本
 1. 一个命名为 someMethod() 的重写方法可以通过 super.someMethod() 在重写方法的实现中调用父类版本的 someMethod() 方法
 2. 一个命名为 someProperty 的重写属性可以通过 super.someProperty 在重写的 getter 或 setter 实现中访问父类版本的 someProperty 属性
 3. 一个命名为 someIndex 的重写下标脚本可以使用 super[someIndex] 在重写的下标脚本实现中访问父类版本中相同的下标脚本
 */


//MARK:3.2 重写方法

/**
 你可以在你的子类中重写一个继承的实例或者类型方法来提供定制的或替代的方法实现
 */

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()


//MARK:3.3 重写属性

/**
 你可以重写一个集成实例或类型属性来为你自己的属性提供你自己自定义的getter 和 setter ，或者添加属性观察器确保当底层属性值改变时来监听重写的属性
 */

//MARK:3.3.1 重写属性的 getter 和 setter

/**
 1. 你可以提供一个自定义的getter （setter ，如果合适的话）来重写任意继承的属性，无论在最开始继承的属性实现为存储属性还是计算属性。
 2. 你必须声明你重写的属性名字和类型，以确保编译器可以检查你的重写是否匹配了父类中有相同名字和类型的属性
 3. 你可以通过在你的子类重写里为继承而来的只读属性添加getter 和 setter 来把他用作可读写属性。你不能把一个继承而来的可读写属性表示为只读属性
 */

//FIXME:如果你提供了一个 setter 作为属性重写的一部分，你也就必须为重写提供一个 getter。如果你不想在重写 getter 时修改继承属性的值，那么你可以简单通过从 getter 返回 super.someProperty 来传递继承的值，someProperty 就是你重写的那个属性的名字


class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}


let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")


//MARK:3.4 重写属性观察器

/**
 你可以使用属性重写来为继承的属性添加属性观察器。这就可以让你在继承属性的值改变时得到通知，无论这个属性最初如何实现。
 */

//FIXME:你不能给继承而来的常量存储属性或者只读的计算属性添加属性观察器。这些属性的值不能被设置，所以提供 willSet 或 didSet 实现作为重写的一部分也是不适合的。

//FIXME:也要注意你不能为同一个属性同时提供重写的setter和重写的属性观察器。如果你想要监听属性值的改变，并且你已经为那个属性提供了一个自定义的setter， 那么你从自定义的setter 里就可以监听任意值的改变


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}


let automatic = AutomaticCar()

automatic.currentSpeed = 35.0

print("AutomaticCar: \(automatic.description)")



//MARK:------------------ 4 阻止重写

/**
 1.你可以通过标记为终点来阻止一个方法、属性或者下标脚本被重写。通过在方法、属性或者下标脚本的关键字前写 final 修饰符（比如 final var， final func， final class func， final subscript）
 */

/**
 2.任何在子类里重写终点方法、属性和下标脚本的尝试都会被报告为编译时错误。你在扩展中添加到类的方法、属性或下标脚本也可以在扩展的定义里被标记为终点。
 
 */

/**
 3. 你可以通过在类定义中 在 class 关键字前面写 final 修饰符 （final class ）标记一整个类为终点。任何想要从终点类创建子类的行为都会被报告一个编译时cuo'wu
 */
