//
//  UIColor+Extension.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/21.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
extension UIColor{
   
     //MARK: -  16进制 转 RGBA
    
    class func rgbaColorFromHex(rgb:Int, alpha:CGFloat) ->UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    
      // MARK: - 16进制 转 RGB
        class func rgbColorFromHex(rgb:Int) ->UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
    
}
