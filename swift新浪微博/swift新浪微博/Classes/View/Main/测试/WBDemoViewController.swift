//
//  WBDemoViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
class WBDemoViewController: WBBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       title  = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }

    // MARK: - 监听方法
    ///继续 push 一个新的控制器
    func showNext(){
        
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension WBDemoViewController{
    ///重写fu
    override func setupUI() {
        super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", fontSize:16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, target: self, action: #selector(showNext),isBack:false)
       
    }

    

}
