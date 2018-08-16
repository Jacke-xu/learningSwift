//
//  privateClass.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/16.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

//private class privateClass: NSObject {
//    func testPrivate() {
//        print("天台呢")
//    }
//}

class privateClass: NSObject {
    private func testPrivate() {
        print("天台呢")
    }
    
    override init() {
        let testpri = privateClass()
        testpri.testPrivate()
    }
}
