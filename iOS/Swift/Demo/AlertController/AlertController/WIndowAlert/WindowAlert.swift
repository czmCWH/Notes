//
//  WindowAlert.swift
//  AlertController
//
//  Created by czm on 2020/5/26.
//  Copyright © 2020 czm. All rights reserved.
//

import UIKit

class WindowAlert: UIViewController {
    
    private lazy var alertWindow: UIWindow = {
        var window = UIWindow(frame: UIScreen.main.bounds)
        // 如果iOS13中，保留了 SceneDelegate,创建window的方式将有所改变
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.first
            if let windowScene = windowScene as? UIWindowScene {
                window = UIWindow(windowScene: windowScene)
            }
        }
                
        window.windowLevel = UIWindow.Level.alert - 1
        window.backgroundColor = .clear
        return window
    }()

    private lazy var backgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        v.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissAlert))
        v.addGestureRecognizer(tap)
        return v
    }()
    
    private lazy var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(self.backgroundView)
        view.addSubview(self.contentView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.backgroundView.frame = view.bounds
        self.contentView.frame = CGRect(x: (view.frame.width - 200) / 2, y: (view.frame.height - 250) / 2, width: 200, height: 250)
    }
    
    init(title: String, message: String) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    public func show() {
        alertWindow.isHidden = false
        alertWindow.rootViewController = self
        
        backgroundView.alpha = 0.0
        contentView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: { [unowned self] () in
            self.backgroundView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    public func dismiss() {
  
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {  [unowned self] () in
            self.contentView.alpha = 0.0
            self.backgroundView.alpha = 0.0
            
        }) { (_) in
            self.alertWindow.isHidden = true
            self.alertWindow.rootViewController = nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc dynamic func dismissAlert() {
        dismiss()
    }
    
//    deinit {
//        print(#function)
//    }

}
