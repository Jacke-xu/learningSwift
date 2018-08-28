//
//  DatailViewController.swift
//  swift(UISearchViewController)
//
//  Created by 范云飞 on 2018/8/27.
//  Copyright © 2018年 范云飞. All rights reserved.
//

import UIKit
//#define IS_IPHONE_X (Screen_Height == 812.0f) ? YES : NO
//#define Height_NavContentBar 44.0f
//
//#define Height_StatusBar (IS_IPHONE_X==YES)?44.0f: 20.0f
//
//#define Height_NavBar    (IS_IPHONE_X==YES)?88.0f: 64.0f
//
//#define Height_TabBar    (IS_IPHONE_X==YES)?83.0f: 49.0f

let IsIphoneX = (UIScreen.main.bounds.size.height == 812.0) ? true : false
let Height_NavContentBar = 44.0
let Height_StatusBar = (IsIphoneX == true) ? 44.0 : 20.0
let Height_NavBar = (IsIphoneX == true) ? 88.0 : 64.0
let Height_TabBar = (IsIphoneX == true) ? 83.0 : 49.0

class DatailViewController: UIViewController {
    var detailDescriptionLabel: UILabel!
    var candyImageView: UIImageView!
    var detailCandy: Candy? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
                detailDescriptionLabel.text = detailCandy.name
                
                let image = UIImage(named: detailCandy.name)
                
                let maxB = detailDescriptionLabel.frame.maxY
                let width: CGFloat = (image?.size.width)!
                let height: CGFloat = (image?.size.height)!
                candyImageView.frame = CGRect(x: 0, y: maxB, width: width, height: height)
                candyImageView.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }
    
    
    func createView() {

        self.detailDescriptionLabel = UILabel(frame: CGRect(x: 0, y: Int(Height_NavBar), width: Int(self.view.frame.size.width), height: 50))

        self.detailDescriptionLabel.textColor =  .candyGreen
        self.view.addSubview(self.detailDescriptionLabel)
        
        
        self.candyImageView = UIImageView(frame: CGRect(x: 0, y: detailDescriptionLabel.frame.maxY, width: self.view.frame.size.width, height: self.view.frame.size.height - 50))
        self.view.addSubview(self.candyImageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        createView()
        configureView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
