//
//  Bundle+Extension.swift
//  swift新浪微博
//
//  Created by 于淼华 on 2017/7/20.
//  Copyright © 2017年 于淼华. All rights reserved.
//

import Foundation
extension  Bundle{
    
    //返回命名空间字符串
    func namespace() -> String {
     return   Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        
    }
}
