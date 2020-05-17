//
//  OneViewController.swift
//  BaseProject
//
//  Created by czm on 2020/4/24.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class BackViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "one"
        view.backgroundColor = UIColor.red
        
        // 设置leftItem
//        setupBackItem()
        
        
    }
    
    // 监听 leftItem的返回操作
    override func clickBack() {
        super.clickBack()
        printLog(123)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
