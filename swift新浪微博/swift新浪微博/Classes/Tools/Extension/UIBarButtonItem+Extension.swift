//
//  UIBarButtonItem+Extension.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/21.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    
    /// 创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize 默认16
    ///   - normalColor: normalColor
    ///   - highlightedColor: highlightedColor
    ///   - target: target
    ///   - action: action
    ///   - isBack: isBack 是否是返回按钮 如果是加上箭头
    convenience   init(title: String, fontSize: CGFloat = 16,normalColor: UIColor,highlightedColor: UIColor,target: Any?,action: Selector,isBack: Bool = false) {
          let  btn = UIButton.ymh_textButton(title, fontSize: fontSize, normalColor:UIColor.darkGray, highlightedColor: UIColor.orange)
        if isBack {
            let imageName = "navigationbar_bakc_withtext"
          
            btn.setImage(UIImage(named: imageName), for:UIControlState(rawValue: 0))
            btn.setImage(  UIImage(named: imageName + "_highlighted"), for:UIControlState.highlighted)
            btn.sizeToFit()
            
        }
      
        btn.addTarget(target, action: action, for: .touchUpInside)
        //self.inin() 实例化 UIBarButtonItem
        self.init(customView:btn)
    
    }
}
