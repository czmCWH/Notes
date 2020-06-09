//
//  RedViewController.swift
//  AlertController
//
//  Created by czm on 2020/6/2.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class ModalAlertViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        label.text = "提示文本"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
        view.addSubview(label)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        label.frame = CGRect(x: 10, y: 10, width: view.frame.width - 20, height: view.frame.height - 20)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }

}
