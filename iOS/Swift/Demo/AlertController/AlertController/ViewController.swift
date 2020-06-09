//
//  ViewController.swift
//  AlertController
//
//  Created by czm on 2020/5/26.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if navigationController?.viewControllers.count ?? 0 <= 1 {
            tabBarController?.hideTabbar(hidden: false)
        }
    }
}


class ViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    let data: [String] = ["UIAlertController 方式 Alert", "UIAlertController 方式 actionSheet", "window 方式弹出 Alert", "window 方式弹出 actionSheet", "Modal Transition 方式 Alert", "Navigation Transition转场", "TabBar Transition转场"]
    
    lazy var modalTransition = ModalTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "首页"
    
        tableView.tableFooterView = UIView()
    }
}




extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        }
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let alert = UIAlertController(title: "提示", message: "少说话，多做事", preferredStyle: .alert)
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            let action2 = UIAlertAction(title: "不行", style: .cancel, handler: nil)
            alert.addAction(action2)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        case 1:
            let alert = UIAlertController(title: "提示", message: "你好啊", preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "拼多多", style: .destructive, handler: nil)
            let action2 = UIAlertAction(title: "京东", style: .default, handler: nil)
            let action3 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            let action4 = UIAlertAction(title: "天猫", style: .destructive, handler: nil)
            let action5 = UIAlertAction(title: "淘宝", style: .default, handler: nil)
            alert.addAction(action1)
            alert.addAction(action2)
            alert.addAction(action3)
            alert.addAction(action4)
            alert.addAction(action5)
            self.present(alert, animated: true, completion: nil)
        case 2:
            let alert = WindowAlert(title: "提示", message: "你好啊")
            alert.show()
        case 3:
            let alert = WindowActionSheet(title: "提示", message: "你好啊")
            let act1 = ActionSheetItem(title: "相册", type: .default) { (item) in
                print(item.title)
            }
            act1.image = UIImage(named: "audio_chat_24x24_")
            let act2 = ActionSheetItem(title: "拍照", desc: "视频/照片", type: .destructive) { (item) in
                print(item.title)
            }
            act2.image = UIImage(named: "video_chat_24x24_")
            let act3 = ActionSheetItem(title: "取消", type: .default) { (item) in
                print(item.title)
            }
            alert.addAction(act1)
            alert.addAction(act2)
            alert.addAction(act3)
            alert.show()
        case 4:
            let vc = ModalAlertViewController()
            vc.transitioningDelegate = modalTransition
            vc.modalPresentationStyle = .custom
            present(vc, animated: true, completion: nil)
        case 5:
            
            let vc = DetailViewController()
            navigationController?.delegate = vc.navigationDelegate
            navigationController?.pushViewController(vc, animated: true)
            
        case 6:
//            tabBarController?.selectedIndex = 1
            
            let vc = BlueViewController()
            vc.view.backgroundColor = .blue
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
            
//            print(navigationController?.delegate)
            
        default:
            break
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}
