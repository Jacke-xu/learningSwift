//
//  internalClass.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/16.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

internal class internalClass: NSObject {
    internal func testInternal(array: [Any]) {
        for item in array {
            print("item is \(item)")
        }
    }
}
