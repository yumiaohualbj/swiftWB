//
//  WBBaseViewController.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import UIKit
//oc中不支持多继承，但是可以用协议代理
//swift 更加偏向多继承
// class WBBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
//swift中使用extension 可以按照‘函数’分类管理，便于阅读和维护
//1 extension不能有属性
//2 extension不能重写父类方法   重写方法是子类的职责 extensions是对类的扩展


///所有控制器的基类控制器
 class WBBaseViewController: UIViewController{
    /// 表格视图 - 如果用户么有登录，就不创建 可选
    /// 刷新控件  可选
    var refreshControl:UIRefreshControl?
    
    var tableView:UITableView?
    
    var isPullup = false
    

    //自定义导航条
  lazy  var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height:64))
    
    //自定义导航项
  lazy  var  navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    ///重写didSet方法
   override  var title: String?{
        didSet{
            
            navItem.title = title
        }
    }
    
    ///加载数据->空方法 子类继承实现
    func loadData()  {
        //如果子类不实现任何刷新方法，默认关闭刷新控件
        
        refreshControl?.endRefreshing()
    }
    
}


 //MARK: - 设置界面
extension WBBaseViewController{
    
    func setupUI()  {
        
        //取消自动缩进  -> 如果隐藏导航栏 会缩进20个点
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.red
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar(){
        
        //设置navigationBar
        view.addSubview(navigationBar)
        //设置item给bar
        navigationBar.items = [navItem]
        //设置navBar的渲染颜色
        navigationBar.barTintColor = UIColor.rgbColorFromHex(rgb: 0xF6F6F6)
        //设置navBar的title颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]

    }
    
    private func setupTableView(){
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view .insertSubview(tableView!, belowSubview: navigationBar)
        tableView?.delegate = self
        tableView?.dataSource = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        //设置刷新控件
        // 1> 实例化刷新控刷新
        refreshControl = UIRefreshControl()
        // 2> 添加到表格视图
        tableView?.addSubview(refreshControl!)
        // 3> 添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
        
    }
}


//MARK: - Tableviewdelegate，datasouce
extension WBBaseViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    ///基类只负责准备方法，子类负责具体实现
    ///子类的数据源方法 不用实现super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //只是保证没有语法错误
        return UITableViewCell()
    }
    
    /// 在显示最后一行的时候，做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //1 判断indexPath是否是最后一行（indexPath.secton最大/indexPath.row最后一行）
        let row = indexPath.row
        
        let section = tableView.numberOfSections - 1
        print("section---\(section)")
        if row < 0 || section < 0 {
            return
        }
        
        //行数
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) &&  !isPullup{
            //上拉刷新的判断条件
            print("上拉刷新")
            isPullup = true
            //开始刷新
            loadData()
            
        }
        
        
        
    }

}


