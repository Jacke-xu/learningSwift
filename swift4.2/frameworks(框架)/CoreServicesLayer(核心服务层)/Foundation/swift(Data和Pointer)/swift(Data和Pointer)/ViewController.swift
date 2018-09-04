//
//  ViewController.swift
//  swift(Data和Pointer)
//
//  Created by 范云飞 on 2018/9/4.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK:------------------- Data -------------------
        let data = "范云飞".data(using: .utf16)
        let bytes = data?.withUnsafeBytes { [UInt8](UnsafeBufferPointer(start: $0, count: (data?.count)!)) }
        print(bytes ?? "nil")

        
        let data1 = Data.init(bytes: bytes!)
        let string = String.init(data: data1, encoding: .utf16)
        print(string!)
        
        //MARK:------------------- Pointer ----------------
        /**
         参考资料： http://www.swiftyper.com/2017/01/15/unsafe-swift/
         */
        
        //MARK:<------ MemoryLayout ------>
        /**
         swift 提供了MemroyLayout来检测特定类型的大小以及内存及对齐大小
         */
        
        print("------")
        print("MemoryLayout<Int>.size is \(MemoryLayout<Int>.size)")
        print("MemoryLayout<Int>.alignment is \(MemoryLayout<Int>.alignment)")
        print("MemoryLayout<Int>.stride is \(MemoryLayout<Int>.stride)")
        
        print("------")
        print("MemoryLayout<Int16>.size is \(MemoryLayout<Int16>.size)")
        print("MemoryLayout<Int16>.alignment is \(MemoryLayout<Int16>.alignment)")
        print("MemoryLayout<Int16>.stride is \(MemoryLayout<Int16>.stride)")
        
        print("------")
        print("MemoryLayout<Bool>.size is \(MemoryLayout<Bool>.size)")
        print("MemoryLayout<Bool>.alignment is \(MemoryLayout<Bool>.alignment)")
        print("MemoryLayout<Bool>.stride is \(MemoryLayout<Bool>.stride)")
        
        print("------")
        print("MemoryLayout<Float>.size is \(MemoryLayout<Float>.size)")
        print("MemoryLayout<Float>.alignment is \(MemoryLayout<Float>.alignment)")
        print("MemoryLayout<Float>.stride is \(MemoryLayout<Float>.stride)")
        
        print("------")
        print("MemoryLayout<Double>.size is \(MemoryLayout<Double>.size)")
        print("MemoryLayout<Double>.alignment is \(MemoryLayout<Double>.alignment)")
        print("MemoryLayout<Double>.stride is \(MemoryLayout<Double>.stride)")
        
        print("------")
        let array = [0x00, 0x11, 0x22, 0x33]
        print("MemoryLayout.size(ofValue: array) is \(MemoryLayout.size(ofValue: array))")
        
        print("------")
        struct EmptyStruct {}
        print("MemoryLayout<EmptyStruct>.size is \(MemoryLayout<EmptyStruct>.size)")//0
        print("MemoryLayout<EmptyStruct>.alignment is \(MemoryLayout<EmptyStruct>.alignment)")//1
        print("MemoryLayout<EmptyStruct>.stride is \(MemoryLayout<EmptyStruct>.stride)")//1
        
        print("------")
        struct SampleStruct {
            let number: UInt32
            let flag: Bool
        }
        
        print("MemoryLayout<SampleStruct>.size is \(MemoryLayout<SampleStruct>.size)")
        print("MemoryLayout<SampleStruct>.alignment is \(MemoryLayout<SampleStruct>.alignment)")
        print("MemoryLayout<SampleStruct>.stride is \(MemoryLayout<SampleStruct>.stride)")
        
        
        print("------")
        class EmptyClass {}
        print("MemoryLayout<EmptyClass>.size is \(MemoryLayout<EmptyClass>.size)")
        print("MemoryLayout<EmptyClass>.alignment is \(MemoryLayout<EmptyClass>.alignment)")
        print("MemoryLayout<EmptyClass>.stride is \(MemoryLayout<EmptyClass>.stride)")
        
        
        print("------")
        class SampleClass {
            let number: Int16 = 0
            let flag: Bool = false
        }
        
        print("MemoryLayout<SampleClass>.size is \(MemoryLayout<SampleClass>.size)")
        print("MemoryLayout<SampleClass>.alignment is \(MemoryLayout<SampleClass>.alignment)")
        print("MemoryLayout<SampleClass>.stride is \(MemoryLayout<SampleClass>.stride)")
        /**
         由于类都是引用类型，所以它所有的大小都是8字节
         */
        
        //MARK:<------ Pointer ------>
        /**
         一个指针就是对一个内存地址的疯转。在swift当中直接操作指针的类型都有一个“unsafe”前缀，所以它的指针类型称为 UnsafePointer.
         
         swift 的指针类型使用了很清晰的命名，我们可以通过名字知道这是一个什么类型的指针。可变或者不可变、原生(raw)或者有类型的、是否是缓冲(buffer)类型，这三种特性总共组合出了8种指针类型
         */
        
        //MARK:UnsafeMutablePointer<T>  == Type*
        //MARK:UnsafePointer<T>         == const Type*
        //MARK:UnsafeMutableBufferPointer<T>
        //MARK:UnsafeBufferPointer<T>
        //MARK:UnsafeMutableRawPointer  == Void*
        //MARK:UnsafeRawPointer         == const Void*
        //MARK:UnsafeMutableRawBufferPointer
        //MARK:UnsafeRawBufferPointer
        
        
        //FIXME:名称中含有raw的表示指针指向的内存并没有被分配具体的数据类型。名称中不含raw的表示指针指向的内存是有数据类型的
        
        //MARK:----- 1. raw:
        let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        // 表示ptr指向一个内存地址，从这个地址开始，存放了一个Int类型的数据
        
        let rawPtr = UnsafeMutableRawPointer(bitPattern: 0x60)
        //表示rawPtr直线一个内存地址，从这个地址开始存放的数据类型未知
        
        //MARK:UnsafePointer 和 UnsafeRawPointer的相互转化
        let ptr1 = UnsafePointer<Int>(bitPattern: 10)
        let string1 = "12"
        let rawPtr1 = UnsafeRawPointer(string1)
        let ptrAgain = rawPtr1.assumingMemoryBound(to: Int.self)
        print(ptrAgain.pointee)
        

        //MARK:UnsafeMutableRawPointer
        let count = 2
        let stride = MemoryLayout<Int>.stride
        let alignment = MemoryLayout<Int>.alignment
        let byteCount = stride * count
        
        do {
            print("Raw pointers")
            
            let pointerR = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
            
            defer {
                pointerR.deallocate()
            }
            
            pointerR.storeBytes(of: 42, as: Int.self)
            pointerR.advanced(by: stride).storeBytes(of: 6, as: Int.self)
//            pointer.load(as: Int.self)
//            pointer.advanced(by: stride).load(as: Int.self)
            
            let bufferPointer = UnsafeRawBufferPointer(start: pointerR, count: byteCount)
            for (index, byte) in bufferPointer.enumerated() {
                print("byte \(index): \(byte)")
            }
        }
        
        
        //MARK:----- 2. mutable
        
        //FIXME:名称中带有mutable的对应swift中的var， 不带mutable的对应let，描述的是内存中的数据是否可变
        
        let a = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        a.pointee = 40
        a.pointee = 50
        print(a.pointee)// 50
        
        let b = UnsafePointer<Int>(bitPattern: 0x608000008FD0)!
//        b.pointee = 20 //Cannot assign to property: 'pointee' is a get-only property
        
    
        //MARK:----- 3. buffer
        //FIXME:名称中含有buffer的是用来沟通swift的数组和指针
        
        let size = 10
        let array1 = UnsafeMutablePointer<Int>.allocate(capacity: size)
        for idx in 0..<10 {
            array1.advanced(by: idx).pointee = idx
        }
        

        let buffer = UnsafeBufferPointer(start: array1, count: size)
        buffer.forEach({ print("\("$0 is \($0)")") })
        array1.deallocate()
        
        
        //MARK:----- 4. 使用类型指针
        do {
            print("Typed pointers")
            let pointerT = UnsafeMutablePointer<Int>.allocate(capacity: count)
            pointerT.initialize(repeating: 0, count: count)
            defer {
                pointerT.deinitialize(count: count)
                pointerT.deallocate()
            }
            
            pointerT.pointee = 42
            pointerT.advanced(by: 1).pointee = 6
            
            let bufferPointerT = UnsafeBufferPointer(start: pointerT, count: count)
            for (index, value) in bufferPointerT.enumerated() {
                print("value \(index): \(value)")
            }
        }
        
        //MARK:----- 5. 获取一个实例的字节
        /**
         很多时候我们需要从一个现存的实例里获取它的字节。这是可以使用withUnsafeBytes(of:) 方法
         */
        
        do {
            print("Getting the bytes of an instance")
            var sampleStruct = SampleStruct(number: 25, flag: true)
            withUnsafeBytes(of: &sampleStruct) { (bytes) in
                for byte in bytes {
                    print(byte)
                }
            }
        }
        
        /**
         whitUnsafeBytes 同样适合用于Array 和 Data 的实例
         */
        
        
        //MARK:----- 6. 使用swift操作指针的三大原则
        
        //MARK:不要从withUnsafeBytes中返回指针
        do {
            print("don't return the pointer from withUnsafeBytes")
            var smpleStruct1 = SampleStruct(number: 39, flag: true)
            let bytes1 = withUnsafeBytes(of: &smpleStruct1) { (bytes)in
                return bytes
            }
            
            print("bytes1 is \(bytes1)")// UnsafeRawBufferPointer(start: 0x00007ffeee12e0f0, count: 5)
            
        }
        
        //MARK:一次只绑定一种类型
        do {
            print("only bind to one type at a time")
            let countNew = 3
            let strideNew = MemoryLayout<Int16>.stride
            let alignmentNew = MemoryLayout<Int16>.alignment
            let byteCountNew = countNew * strideNew
            
            
            class Animal {
                let name: String?
                let age: Int = 0
                init(name: String, age: Int) {
                    self.name = name
                }
            }
            let pointerNew = UnsafeMutableRawPointer.allocate(byteCount: byteCountNew, alignment: alignmentNew)
            let typedPointer1 = pointerNew.bindMemory(to: UInt16.self, capacity: countNew)
//            let typedPointer2 = pointerNew.bindMemory(to: Animal.self, capacity: countNew * 2)
            
            typedPointer1.withMemoryRebound(to: Bool.self, capacity: countNew * 2) { (boolPointer) in
                print(boolPointer.pointee)
            }
        }
        
        //FIXME:不要让一个内存同时绑定两个不同的类型。如果你需要这么做。可以使用withMemoryRebound(to: capacity:)来对内存进行重新绑定。并且，这条规则也变名了不要将一个基本类型重新绑定到一个自定类型上。
        
        
        //MARK:不要操作超出范围的内存
        do {
            print("don't walk off the end ... whoops")
            
            let count2 = 3
            let stride2 = MemoryLayout<Int16>.stride
            let alignment2 = MemoryLayout<Int16>.alignment
            let byteCount2 = count2 * stride2
            
            let pointer2 = UnsafeMutableRawPointer.allocate(byteCount: byteCount2, alignment: alignment2)
            let bufferPointer2 = UnsafeRawBufferPointer(start: pointer2, count: byteCount2 + 10)
            for byte in bufferPointer2 {
                print(byte)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

