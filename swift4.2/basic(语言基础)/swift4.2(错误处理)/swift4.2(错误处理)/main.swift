//
//  main.swift
//  swift4.2(错误处理)
//
//  Created by 范云飞 on 2018/7/28.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:---------------------------- 错误处理 ---------------------------

/**
 错误处理是响应和接收来自程序中错误条件的过程。swift 给运行时可恢复错误的抛出、捕获、传递、操作提供了支持
 */

//FIXME:swift 中的错误处理表示法兼容于 Cocoa 和 Objective-C 中的 NSError 类错误处理模式。



//MARK:---------------------- 1 表示 和 抛出错误

/**
 swift中， 错误表示为遵循 Error 协议类型的值。这个空的协议明确了一个类型可以用于错误处理
 */

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)


//MARK:---------------------- 2 处理错误

/**
 1. 当一个错误被抛出，周围的某些代码必须为处理错误响应--------------比如说，为了纠正错误，尝试替代方案，或者把错误通知用户
 2. swift中 有四种方式来处理错误
 */


//MARK:2.1 使用抛出函数传递错误

/**
 为了明确一个函数或者方法可以抛出错误，你要在他的声明当中的形式参数后边写上 throws 关键字。使用 throws 标记的函数叫做抛出函数。如果他明确了一个返回类型，那么 throws 关键字要在返回 箭头（->） 之前
 */

//func canThrowErrors()  throws -> String

/**
 抛出函数可以把它内部抛出的错误传递到它被调用的生效范围之内
 */

//FIXME:只有抛出函数可以传递错误。任何在非抛出函数中抛出的错误都必须在该函数内部处理

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Despensing \(name)")
    }
}

/**
 由于 vend(itemNamed:) 方法的传递它抛出的任何错误，所以你调用它的代码要么直接处理错误----------使用 do-catch 语句，try？或者 try！--------要么继续传递它们。
 */

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]


func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

try? buyFavoriteSnack(person: "Alice", vendingMachine: VendingMachine())

struct PurchaseSanck {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


//MARK:2.2 使用 Do-Catch 处理错误

//MARK:使用 do-catch 语句来通过运行一段代码处理错误。如果do分句中抛出了一个错误，它就会与 catch 分句匹配，已确认其中之一可以处理错误,如下面的例子：

/*
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where conditiion {
    statements
}
 */

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection .")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. please insert an additional \(coinsNeeded) coins.")
}


func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Invalid selection, out of stock, or not enough money.")
    }
}


do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}



//MARK:2.3 转换错误为可选项

/**
 使用 try? 通过将错误转换为可选项来处理一个错误。如果一个错误在try？ 表达式中抛出，则表达式的值为nil。
 */

func someThrowingFunction() throws -> Int {
    return 10
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch  {
    y = nil
}

/*
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}
 */


//MARK:2.4 取消错误传递

/**
 你可以使用 try！来取消错误传递并且把调用放进不会有错误抛出的运行时断言当中。如果错误真的抛出了，你会的到一个运行时错误。
 */

//let photo  = try! loadImage("./Resources/John Appleseed.jpg")
/**
 上面的代码使用了 loadImage(_:)函数，它在给定路径下加载图像资源，如果图像不能被加载则抛出一个错误。在这种情况下，由于图像跟着应用走，运行时不会有错误抛出，所以取消错误传递是合适的
 */



//MARK:---------------------- 3 指定清理操作

/**
 使用 defer 语句来在代码离开当前代码块前执行语句合集。
 */

/*
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            
        }
    }
}
 */
