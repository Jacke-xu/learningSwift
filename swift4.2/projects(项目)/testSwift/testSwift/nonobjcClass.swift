//
//  nonobjcClass.swift
//  testSwift
//
//  Created by 范云飞 on 2018/8/21.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

//@objcMembers
class nonobjcClass: NSObject {
    func fuck() {
        print("motherFucking")
    }
    
    func get() -> (Int, Int) {
        return (1, 1)
    }
}

extension nonobjcClass {
    public func sayhello() {
        print("qunidayede")
    }
}

class subClass: nonobjcClass {
    func bar() {
        print("汪汪汪")
    }
}

extension subClass {
    func bar1() {
        print("我是大黄")
    }
}

@nonobjc extension nonobjcClass {
    func goodbyt() {
        print("👋👋👋👋👋👋")
    }
}
