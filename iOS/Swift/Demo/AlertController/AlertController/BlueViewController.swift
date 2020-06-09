//
//  BlueViewController.swift
//  AlertController
//
//  Created by czm on 2020/6/4.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "blue"
        
//        let backItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(goBack))
//        let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
//        spaceItem.width = -15
//        navigationItem.leftBarButtonItems = [spaceItem, backItem]
        
        
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }

}
