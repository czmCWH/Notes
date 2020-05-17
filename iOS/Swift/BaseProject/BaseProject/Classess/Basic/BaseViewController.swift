//
//  BaseViewController.swift
//  BaseProject
//
//  Created by czm on 2020/4/23.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func setupBackItem() {
        let leftButton = UIButton(type: .custom)
        leftButton.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        leftButton.setImage(UIImage(named: "nav_back_black"), for: .normal)
        leftButton.contentHorizontalAlignment = .left;
        leftButton.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftItem
    }

    @objc func clickBack() {
        navigationController?.popViewController(animated: true)
    }


}

extension BaseViewController: UIGestureRecognizerDelegate {
    
}

