//
//  ViewController.swift
//  testCocopods
//
//  Created by 范云飞 on 2018/8/16.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK:测试cocoapods的使用
        let label = UILabel.init()
        label.text = "测试label"
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.black
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(100)
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        //MARK:测试swift类调用Objective-C方法
        let testObj = testObjectiveC()
        testObj.testPrint()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

