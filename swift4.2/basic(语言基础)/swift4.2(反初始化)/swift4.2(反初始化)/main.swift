//
//  main.swift
//  swift4.2(反初始化)
//
//  Created by 范云飞 on 2018/7/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation


//MARK:---------------------------- 反初始化 -----------------------------


/**
 在类实例被释放的时候，反初始化器就会立即被调用。你可以用deinit 关键字来写反初始化器
 */

//MARK:---------------------- 1 反初始化器原理

/**
 当实例不再被需要的时候swift会自动将其释放掉，以节省资源。swift 通过自动引用计数来处理实例的内存管理
 */

//deinit {
//
//}

/**
 1. 每个类当中只能有一个反初始化器。反初始化器在实例被释放之前自动被调用。你不能字形调用反初始化器。父类的反初始化器可以被子类继承，并且子类的反初始化器实现结束之后父类的反初始化器会被调用。父类的反初始化器总会被调用，就算子类没有反初始化器。
 2. 由于实例在反初始化器被调用之前都不会被释放，反初始化器可以访问实例中的所有属性并且可以基于这些属性修改自身行为。
 */



//MARK:---------------------- 2 应用反初始化器

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsRequested
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}


var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")

print("THere are now \(Bank.coinsInBank) coins left in the bank")


playerOne = nil

print("Playerone has left the game")

print("the bank now has \(Bank.coinsInBank) coins")
