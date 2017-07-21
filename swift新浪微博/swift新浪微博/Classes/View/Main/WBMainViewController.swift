//
//  WBMainViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {
  var composeButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        setupComposeButton()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 监听方法
    ///撰写微博
    // FIXME:没有实现
    // private 既能够保证方法私有，仅在当前对象被访问
    // @objc 允许这个函数在‘运行时’通过OC的消息机制调用
    func composeStatus() {
        print("撰写微博")
    }

    
   //MARK: - 私有控件
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//extension 类似于OC的分类，在swift中可以用来切分代码
//可以吧相近功能函数，放在一个extension中
//便于代码维护
//注意：和OC的分类一样，extension中不能定义属性
//MARK: 设置界面
extension WBMainViewController{
    
    //设置撰写按钮
    
     func setupChildControllers( ){
        let array = [
            ["clsName":"WBHomeViewController","title":"首页","imageName":"space"],
            ["clsName":"WBMessageViewController","title":"消息","imageName":"wechat"],
            ["clsName":"UIViewController"],
            ["clsName":"WBDiscoverViewController","title":"发现","imageName":"dynamic"],
            ["clsName":"WBProfileViewController","title":"我","imageName":"friend"],
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
        
    }
    
    //dict[clsName,title,imageName]
    
    private func controller(dict:[String:String])->UIViewController{
        
        guard  let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace()+"."+clsName) as? UIViewController.Type else {
            
            return UIViewController()
        }
        //创建视图控制器
        let vc = cls.init()
        
        vc.title = title
        
        //设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_"+imageName)
        vc.tabBarItem.selectedImage = UIImage(named:"tabbar_"+imageName+"_selected")?.withRenderingMode(.alwaysOriginal)
        //设置tabbar标题字体
        vc.tabBarItem.setTitleTextAttributes(
            [NSForegroundColorAttributeName:UIColor.orange],
            for:.highlighted)
        
        vc.tabBarItem.setTitleTextAttributes(
            [NSFontAttributeName:UIFont.systemFont(ofSize: 12)],
            for: UIControlState.init(rawValue: 0))
        //实例化导航控制器的时候，
        let nav = WBNavigationController(rootViewController: vc)
        return nav
        
    }
    
    
     func setupComposeButton() {
        
        print("添加撰写按钮")
        composeButton = UIButton()
        composeButton.setImage(UIImage(named:"tabbar_fastadd"),
                               for: UIControlState.init(rawValue: 0))
//        composeButton.setBackgroundImage(UIImage(named:"tabbar_fastselect"),                                          for: UIControlState.init(rawValue: 0))
        
        
        let count = CGFloat(childViewControllers.count)
        
        let w = tabBar.bounds.width / count - 1
        composeButton.frame = CGRect(x: 2*w, y: 0, width: w, height: tabBar.bounds.height)
        composeButton.addTarget(self, action:#selector(composeStatus),for:.touchUpInside)
        
       
        tabBar.addSubview(composeButton)
    }
    
   
}
