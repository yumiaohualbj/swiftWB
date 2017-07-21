//
//  AppDelegate.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //桥接文件，专门引用OC的头文件


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = WBMainViewController()
        window?.makeKeyAndVisible()
        return true
    }

    

}

