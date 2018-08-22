//
//  main.swift
//  swift(指针的使用)
//
//  Created by 范云飞 on 2018/8/22.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import Foundation
import Accelerate


//https://onevcat.com/2015/01/swift-pointer/


//MARK:/* 1. 指向 Int 类型的指针 */
let intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
intPtr.initialize(to: 10)
print("intPtr is \(intPtr)")

intPtr.deinitialize(count: 1)
intPtr.deallocate()

//MARK:/* 2. 指向数组类型的指针 */
let a: [Float] = [1, 2, 3, 4]
let b: [Float] = [0.5, 0.25, 0.125, 0.0625]
var result: [Float] = [0, 0, 0, 0]
vDSP_vadd(a, 1, b, 1, &result, 1, 4)
print("result is \(result)")

var array = [1, 2, 3, 4, 5]
var arrayPtr = UnsafeMutableBufferPointer<Int>(start: &array, count: array.count)
if let basePtr = arrayPtr.baseAddress {
    //修改array中首个元素的值
    print("改变前的值 basePtr.pointee is \(basePtr.pointee)")
    basePtr.pointee = 10
    print("改变后的值 basePtr.pointee is \(basePtr.pointee)")
    
    
    //下一个元素的值
    let nextPtr = basePtr.successor()
    print("nextPtr.pointee is \(nextPtr.pointee)")
    
}

//MARK:/* 3.指针操作和转换 */
/**
 withUnsafePointer/withUnsafeMutablePointer
 */

var test = 10
test = withUnsafeMutablePointer(to: &test, { (ptr: UnsafeMutablePointer<Int>) -> Int in
    ptr.pointee += 1
    return ptr.pointee
})

print("test is \(test)")


/**
 unsafeBitCast: 会将一个指针指向内存强制按位转换为目标的类型。
 */

let arr = NSArray(object: "mefyf")
let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), to: CFString.self)
print("str is \(str)")

/**
 unsafeBitCast 的更常见的使用场景是不同类型指针之间进行转换。
 */

var count = 100
let voidPtr = withUnsafePointer(to: &count) { (a: UnsafePointer<Int>) -> UnsafePointer<Void> in
    return unsafeBitCast(a, to: UnsafePointer<Void>.self)
}
//voidPtr 是 UnsafePointer<Void> ， 相当于C 中的 void *

let intPtr1 = unsafeBitCast(voidPtr, to: UnsafePointer<Int>.self)
print("intPtr1.pointee is \(intPtr1.pointee)")

