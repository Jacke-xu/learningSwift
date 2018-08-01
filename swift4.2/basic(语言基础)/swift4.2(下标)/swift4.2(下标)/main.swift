//
//  main.swift
//  swift4.2(下标)
//
//  Created by 范云飞 on 2018/7/26.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation

//MARK:--------------------------------- 下标--------------------------------

/**
 类、结构体、枚举可以定义下标，它可以作为访问集合、列表、序列成员元素的快捷方式。
 */


//MARK:------------------------ 1 下标的语法

/**
 1. 下标脚本允许你通过在实例名后面的方括号内写一个或多个值对该类的实例进行查询
 2. 使用关键字 subscript 来定义下标，并且指定一个或多个输入形式参数和返回类型
 3. 下标可以是读写也可以是只读的
 */

/**
 subscript(index: Int) -> Int {
 get {
 
 }
 set(newValue) {
 
 }
 }
 */

/**
 newValue 的类型和下标返回值一样。与计算属性一样，你可以选择不去指定 setter的 （newValue）形式参数。 setter 默认提供形式参数 newValue,如果你自己没有提供的话与只读计算属性一样，你可以给只读下标省略 get 关键字， 如下：
 subscript(index: Int) -> Int {
 
 }
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")



//MARK:------------------------ 2 下标用法

/**
 “下标” 确切的意思取决于它使用的上下文。通常下标是用来访问集合、列表、序列中元素的快捷方法。你可以在你自己特定类或结构体中自由实现下标来提供合适的功能
 */

var numberOfLegs = ["spider": 8, "and": 6, "cat": 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)



//MARK:------------------------ 3 下标选项

/**
 下标可以接收任意数量的输入形式参数，并且这些输入形式参数可以是任意类型。下标也可以返回任意类型。下标可以使用变量形式参数和可变形式参数，但是不能使用输入输出形式参数或提供默认形式参数值
 */

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    /* 判断row 或 column 值是否会造成数组越界 */
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row :Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

print(matrix.grid)

//let someValue = matrix[2. 2]

