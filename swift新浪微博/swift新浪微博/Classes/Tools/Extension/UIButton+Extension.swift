//
//  UIButton+Extension.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/21.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
extension UIButton{
    class func ymh_textButton(_ text: String,fontSize: CGFloat ,normalColor:UIColor, highlightedColor: UIColor) -> UIButton{
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle(text, for: UIControlState.normal)
        btn.setTitle(text, for: .highlighted)
        btn.setTitleColor(normalColor, for:.normal)
        btn.setTitleColor(highlightedColor, for: .highlighted)
        btn.sizeToFit()
        return btn
    }
    
}
