//
//  testNonobjcClass.swift
//  testSwift
//
//  Created by 范云飞 on 2018/8/21.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class testNonobjcClass: NSObject {
    func testPrint() {
        print("hello")
    }
    
    @nonobjc func show() {
        testPrint()
    }
}
