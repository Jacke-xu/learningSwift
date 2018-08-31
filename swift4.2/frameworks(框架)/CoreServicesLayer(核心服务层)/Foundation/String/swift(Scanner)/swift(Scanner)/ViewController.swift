//
//  ViewController.swift
//  swift(Scanner)
//
//  Created by 范云飞 on 2018/8/30.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var sstring: NSString?
        let scan = Scanner(string: "32jingki")
        while !scan.isAtEnd{ // 判断是否扫描到最后
            scan.scanLocation += 1
            print(scan.scanLocation)
            scan.scanString("l", into: &sstring)
        }
        
        print(sstring ?? "sstring is nil")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

