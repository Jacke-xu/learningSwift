//
//  fileprivateClass.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/16.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

fileprivate class fileprivateClass: NSObject {
    public func testFileprivate() {
        print("testFileprivate")
    }
}



class cutomClass:NSObject {
    
    override init() {
    }
    
    func test() {
        let subFileprivate = fileprivateClass()
        subFileprivate.testFileprivate()
    }
    
}
