//
//  ViewController.swift
//  layout
//
//  Created by czm on 2020/6/28.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "第一页"
        view.backgroundColor = .white

        
        
        print(UIScreen.main.bounds, UIScreen.main.scale, UIScreen.main.nativeScale)
        
    }
    
    
    
    @IBAction func clickAutoresizing(_ sender: UIButton) {
        navigationController?.pushViewController(AutoresizingViewController(), animated: true)
    }
    
    
    @IBAction func clickAutoLayout(_ sender: UIButton) {
        
        navigationController?.pushViewController(AutoLayoutViewController(), animated: true)
    }
    
    @IBAction func clickStackView(_ sender: UIButton) {
        navigationController?.pushViewController(StackViewController(), animated: true)
    }
    
    @IBAction func clickStackXib(_ sender: UIButton) {
        navigationController?.pushViewController(StackXibViewController(), animated: true)
    }
    
    
}

