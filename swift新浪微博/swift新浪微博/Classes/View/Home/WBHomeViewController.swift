//
//  WBHomeViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit

//定义全局常量 尽量用private修饰 不然到处可以使用
private let cellId = "cellId"

class WBHomeViewController: WBBaseViewController {

   ///微博数据数组
    lazy var statusList = [String]()
    
    ///重写数据加载方法
    override func loadData(){
        print("开始加载数据")
        //模拟‘延迟’加载数据 - dispatch_after
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
        }
        for i in 0..<15 {
            ///将数据插入到数据源的顶部
            statusList.insert(i.description, at: 0)
        }
        
        //结束刷新控件
       self.refreshControl?.endRefreshing()
        
        print("刷新表格")
        //刷新表格
        self.tableView?.reloadData()
    }
    
   func showFriends(){
        
        print(#function)
    let vc = WBDemoViewController()
    
//    vc.hidesBottomBarWhenPushed = true
    navigationController?.pushViewController(vc, animated: true)
    }
    
    

}


//MARK: - 表格数据源方法
extension WBHomeViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // 1 取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //2 设置cell
        cell.textLabel?.text = statusList[indexPath.row]
        
        //3 返回cell
        return cell
        
    }
}

extension WBHomeViewController{
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = UIColor.blue
        //设置导航栏按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize:16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange, target: self, action: #selector(showFriends))
        
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier:cellId)
        
     
    }

}
