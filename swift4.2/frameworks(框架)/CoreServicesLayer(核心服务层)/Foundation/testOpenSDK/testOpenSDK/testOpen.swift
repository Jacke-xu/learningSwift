//
//  testOpen.swift
//  testOpenSDK
//
//  Created by 范云飞 on 2018/8/16.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

open class testOpen: NSObject {
    
    open var openProperty = 100
    
    open func disorder (orders:Array<Any>) -> Array<Any> {
        var temp = orders
        var count = Int(temp.count)
        while count > 0 {
            let index = Int(arc4random_uniform(UInt32(Int32(count))))
            let last =  Int(count-1)
            temp.swapAt(index, last)
            count -= 1
        }
        return temp
    }
}
