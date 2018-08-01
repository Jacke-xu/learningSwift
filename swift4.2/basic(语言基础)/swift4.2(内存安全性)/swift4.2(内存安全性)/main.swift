//
//  main.swift
//  swift4.2(内存安全性)
//
//  Created by 范云飞 on 2018/7/31.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:----------------------------- 内存安全性 ------------------------------

/**
 默认情况下，swift 会阻止你代码中发生的不安全行为。如：访问是释放后的内存、数组越界、访问拥有内存独占访问权的内存
 */


//MARK:---------------------- 1 了解内存访问冲突

/**
 内存访问冲突在你的代码不同地方同一时间尝试访问同一块内存是发生。在同一时间多出访问同一块内存会产生不可预料或者说不一致的行为。
 */

//FIXME:如果你写并发或者多线程代码，内存访问冲突可能会使一个常见的问题。1. 如果你在单线程遇到内存访问冲突，swift 会保证你在要么编译时要么运行时得到错误。2. 对于多线程，使用Thread Sanitizer 来帮助探测线程之间的访问冲突


//MARK:1.1 典型的内存访问

/**
 具体来说，冲突会在你用两个访问并满足下列条件是发生：
  * 至少一个是写入访问
  * 它们访问的是同一块内存
  * 它们的访问时间重叠
 */

/**
 如果一个访问在启动后其他代码不能执行直到它结束后才能，那么这个访问就是即时的。基于它们的特性，两个即时访问不能同时发生。大多数内存访问都是即时的。比如，下面列数的所有读写访问都是即时的：
 */
func oneMore(than number: Int) -> Int {
    return number + 1
}


var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)



//MARK:---------------------- 2 输入输出形式参数的访问冲突

var stepSize = 1

func increment(_ number: inout Int) {
    number += stepSize
}

//increment(&stepSize)

/**
 上面的例子中，stepSize 是一个全局变量，它通常可以在 increment(_:) 中可以访问。总是，stepSize 的读取访问 与 number 的写入访问重叠了。number 和 stepSize 引用的是同一内存地址。 读取和写入访问引用同一内存并且重叠，产生了冲突。
 */

var copyOfStepSize = stepSize

increment(&copyOfStepSize)

stepSize = copyOfStepSize
print(stepSize)



func balance(_ x:  inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)
//balance(&playerOneScore, &playerOneScore)



//MARK:---------------------- 3 在方法中对 self 的访问冲突

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 0
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}


extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)

oscar.shareHealth(with: &maria)



//MARK:---------------------- 4 属性的访问冲突

/**
 像结构体、元组、枚举这些类型都是独立值构成。这些类型的元素，都是值类型，改变任何一个值都会改变整个类型，意味着读或者写访问到这些属性就需要对整个值进行读写访问
 */

var playerInformation = (health: 10, energy: 20)

//balance(&playerInformation.health, &playerInformation.energy)

 var holly = Player(name: "Holly", health: 10, energy: 10)
//balance(&holly.health, &holly.energy)


func someFunction() {
    var oscar = Player(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}

someFunction()


/**
 如果下面的条件可以满足就说明重叠访问结构体的属性时安全的：
   * 你只访问实例的存储属性，不是计算属性或者类属性
   * 结构体是局部变量而非全局变量
   * 结构体要么灭有被闭包捕获要么只被非逃逸闭包捕获
 */
