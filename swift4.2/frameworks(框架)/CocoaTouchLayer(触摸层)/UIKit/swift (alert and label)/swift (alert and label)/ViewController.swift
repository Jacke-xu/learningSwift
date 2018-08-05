//
//  ViewController.swift
//  swift (alert and label)
//
//  Created by 范云飞 on 2018/8/5.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testButton = UIButton(frame: CGRect(x: 100, y: 100, width: 80, height: 30))
        testButton.center.x = self.view.center.x
        testButton.backgroundColor = UIColor.black
        testButton.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        self.view.addSubview(testButton)
        
        
        
        let slider = UISlider(frame: CGRect(x: 30, y: 200, width: self.view.frame.size.width - 60, height: 20))
        slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .touchUpInside)
        slider.minimumTrackTintColor = UIColor.black
        slider.maximumTrackTintColor = UIColor.red
        self.view.addSubview(slider)
        
    }
    
    @objc func click(_ sender: UIButton) {
        let message = "The value of the slider is : \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, world",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

