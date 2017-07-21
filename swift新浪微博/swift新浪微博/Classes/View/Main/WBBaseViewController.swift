//
//  WBBaseViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
 class WBBaseViewController: UIViewController {

    //自定义导航条
  lazy  var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height:64))
    
    //自定义导航项
  lazy  var  navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    ///重写didSet方法
   override  var title: String?{
        didSet{
            
            navItem.title = title
        }
    }
    
}
 //MARK: - 设置界面
extension WBBaseViewController{
    
    func setupUI()  {
        view.backgroundColor = UIColor.red
      
        //设置navigationBar
        view.addSubview(navigationBar)
        
        //设置item给bar
        navigationBar.items = [navItem]
        //设置navBar的渲染颜色
       navigationBar.barTintColor = UIColor.rgbColorFromHex(rgb: 0xF6F6F6)
       //设置navBar的title颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
    }
}
