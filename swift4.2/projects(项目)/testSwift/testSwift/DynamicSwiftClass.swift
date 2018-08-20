//
//  DynamicSwiftClass.swift
//  testSwift
//
//  Created by 范云飞 on 2018/8/20.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class DynamicSwiftClass: NSObject {
    var zero = 0
    @objc dynamic var first = 1
    @objc func dynamicFunc() {
        print("去你大爷的")
    }
    
    //            Property cannot be marked @objc because its type cannot be represented in Objective-C
    //            @objc dynamic var adddd = (0, 0)
    
    //            Method cannot be marked @objc because its result type cannot be represented in Objective-C
    //            @objc dynamic func someMethod(value: Int) -> (Int, Int) {
    //                return (1, 1)
    //            }
}
