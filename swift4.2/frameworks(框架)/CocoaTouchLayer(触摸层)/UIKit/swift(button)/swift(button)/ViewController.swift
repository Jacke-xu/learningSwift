//
//  ViewController.swift
//  swift(button)
//
//  Created by 范云飞 on 2018/8/5.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let upButton = UIButton(frame: CGRect(x: 00, y: 100, width: 80, height: 30))
        upButton.center.x = self.view.center.x
        upButton.setTitle("upButton", for: UIControlState.normal)
        upButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        upButton.addTarget(self, action: #selector(upButton(_ :)), for: .touchUpInside)
        self.view.addSubview(upButton)
    }
    
    
    @objc func upButton(_ sender: Any) {
        let alert = UIAlertController(title: "Hello, world",
                                      message: "我是手动创建的按钮!",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome",
                                   style: UIAlertActionStyle.default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func downButton(_ sender: Any) {
        let alert = UIAlertController(title: "Hello, world",
                                      message: "我是xib拖拽按钮!",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome",
                                   style: UIAlertActionStyle.default,
                                   handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

