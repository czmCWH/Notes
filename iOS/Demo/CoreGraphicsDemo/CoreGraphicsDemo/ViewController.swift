//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by czm on 2020/8/19.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit
@_exported import SnapKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.rowHeight = 50
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
        table.backgroundColor = .white
        return table
    }()
    
    let data = ["Core Graphics绘制路径", "颜色空间", "CTM和CGAffineTransform变换", "模式", "阴影、渐变、透明层"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Core Graphics绘图"
        view.backgroundColor = .white
        
        
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self.view)
            make.top.equalTo(self.topLayoutGuide as! ConstraintRelatableTarget)
        }
    }


}


extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
        }
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let vc = PathViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ColorSpacesController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = TransformViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = PatternViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = ShadowViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
       
    }
    
}

