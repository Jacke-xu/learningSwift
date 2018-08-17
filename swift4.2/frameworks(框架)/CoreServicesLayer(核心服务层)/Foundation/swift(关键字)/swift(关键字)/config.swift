//
//  config.swift
//  swift(关键字)
//
//  Created by 范云飞 on 2018/8/17.
//  Copyright © 2018年 范云飞. All rights reserved.
//

//MARK:-------------------- 配置全局变量 ------------------------

import Foundation
import UIKit

//MARK: /*********颜色***********/
//RGB转换
func RGB(r: CGFloat,g: CGFloat,b: CGFloat) -> UIColor {
    //
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}

//主题色
public let THEME_COLOR = UIColor(red: 33/255.0, green: 41/255.0, blue: 54/255.0, alpha: 1.0)
//背景色
public let BG_COLOR = UIColor(red: 246/225.0, green: 246/225.0, blue: 246/225.0, alpha: 1.0)
//分割线颜色
public let LINE_COLOR = UIColor(red: 217/225.0, green: 217/225.0, blue: 217/225.0, alpha: 1.0)

//MARK: /*********尺寸***********/

//设备屏幕尺寸
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

//获取视图尺寸
public func VIEW_WIDTH (view: UIView) -> CGFloat {
    return view.frame.size.width
}
public func VIEW_HEIGHT (view: UIView) -> CGFloat {
    return view.frame.size.height
}

//MARK: /*********网络***********/

////判断网络是否可用
//public func NETWORK_AVILIABLE() -> Bool {
//    //
//    let reachability: Reachability
//    do{
//        reachability = try Reachability.reachabilityForInternetConnection()
//
//        if (reachability.isReachable()) {
//            //
//            print("network is available")
//            return true
//        }
//        else {
//            //
//            print("network is not available")
//            return false
//        }
//
//    }
//    catch{
//        //
//        print("Unable to create Reachability")
//        return false
//    }
//}
