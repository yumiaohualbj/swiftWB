//
//  WBHomeViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
   func showFriends(){
        
        print(#function)
    let vc = WBDemoViewController()
    
//    vc.hidesBottomBarWhenPushed = true
    navigationController?.pushViewController(vc, animated: true)
    }

}

extension WBHomeViewController{
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = UIColor.blue
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize:16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, target: self, action: #selector(showFriends))
     
    }

}
