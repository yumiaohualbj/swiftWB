//
//  WBNavigationController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏系统navBar
        navigationBar.isHidden = true
    }
    
    /// 重写push方法，所有的push动作都会调用此方法
    /// viewcontroller 是被push控制器，设置它的左侧按钮作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
       //如果不是栈底控制器才需要隐藏，根控制器不需要处理
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            //判断控制器的类型
            if let vc = viewController as? WBBaseViewController {
                //去除自定义的navItem
                var  title = "返回"
                //判断控制器的级数，如果只有一个子控制器的时候，显示栈底控制器的标题
                if childViewControllers.count == 1  {
                    //title显示首页的标题
                   title =  childViewControllers.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title:title, fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, target: self, action: #selector(popToParent),isBack:true)
                
            }

        }
        
        
        super.pushViewController(viewController, animated: true)
        
    }
    
    func popToParent()  {
    popViewController(animated: true)
    }
    
}
