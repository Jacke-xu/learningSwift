//
//  Model.swift
//  swift(Collections)
//
//  Created by 范云飞 on 2018/9/12.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class Model: NSObject {
    var name: String = ""
    var age: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
}
