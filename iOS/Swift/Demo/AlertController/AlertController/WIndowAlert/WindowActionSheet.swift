//
//  WindowActionSheet.swift
//  AlertController
//
//  Created by czm on 2020/5/27.
//  Copyright © 2020 czm. All rights reserved.
//
/**
    自定义一个底部弹框
        可进行 无标题、无图片、有取消按钮、详细等设置
 
 参考：https://github.com/alexiscn/WXActionSheet
 */


import UIKit

protocol WindowActionSheetDelegate: NSObjectProtocol {
    func windowActionSheet(_ item: ActionSheetItem)
}

class WindowActionSheet: UIViewController {
    private lazy var alertWindow: UIWindow = {
        var window = UIWindow(frame: UIScreen.main.bounds)
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
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.alpha = 0.0
        return view
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 0))
        containerView.backgroundColor = .white
        return containerView
    }()
    
    weak var delegate: WindowActionSheetDelegate?
    private var headTitle: String?
    private var subtitle: String?
    private var items: [ActionSheetItem] = []
    
    private var itemHeight: CGFloat = 50.0
    private var headHeight: CGFloat = 25.0
    private var contaninerViewHeight: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        containerView.frame.size.height = contaninerViewHeight
        setupCornerRadius(containerView)
    }
    
    init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        headTitle = title
        subtitle = message
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.backgroundView.frame = view.bounds
    }
    
    func addAction(_ item: ActionSheetItem) {
        items.append(item)
    }
    
    
    func show() {
        alertWindow.isHidden = false
        alertWindow.rootViewController = self
        
        self.containerView.frame.origin.y = UIScreen.main.bounds.height
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundView.alpha = 1.0
            self.containerView.frame.origin.y = UIScreen.main.bounds.height - self.contaninerViewHeight
        }, completion: nil)
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {  [unowned self] () in
            self.containerView.frame.origin.y = UIScreen.main.bounds.size.height
            self.backgroundView.alpha = 0.0
            
        }) { (_) in
            self.alertWindow.isHidden = true
            self.alertWindow.rootViewController = nil
        }
    }
    
    @objc dynamic func clickButton(_ btn: UIButton) {
        dismiss()
        
        if btn.tag < items.count {
            let item = items[btn.tag]
            item.handler?(item)
            delegate?.windowActionSheet(item)
        }
    }
    
    private func setupUI() {
        view.addSubview(backgroundView)
        view.addSubview(containerView)
        setupHeader()
        setupItemsUI()
    }
    
    private func setupHeader() {
        guard let hTitle = self.headTitle else { return }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: headHeight))
        label.text = hTitle
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        self.containerView.addSubview(label)
        self.contaninerViewHeight += headHeight
        
        if let subTitle = self.subtitle {
            let label = UILabel(frame: CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: headHeight))
            label.text = subTitle
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            label.textAlignment = .center
            self.containerView.addSubview(label)
            self.contaninerViewHeight += headHeight
        }
        self.contaninerViewHeight += 15
        addLine()
    }
    
    private func setupItemsUI() {
        var cancelItem: ActionSheetItem?
        
        for (index, item) in items.enumerated() {
            
            item.index = index
            
            if item.type == .cancel {
                cancelItem = item
            } else {
                
                createButton(item)
                if index < items.count - 1 { addLine() }
            }
        }
        
        guard let item = cancelItem else {
            let btn = self.containerView.subviews.last as? UIButton
            btn?.frame.size.height += safeInsets.bottom
            btn?.titleEdgeInsets = UIEdgeInsets(top: -safeInsets.bottom/2, left: 0, bottom: safeInsets.bottom/2, right: 0)
            self.contaninerViewHeight += safeInsets.bottom
            return
        }
        
        let separator = CALayer()
        separator.frame = CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: 7)
        separator.backgroundColor = UIColor(white: 242.0/255, alpha: 1.0).cgColor
        self.containerView.layer.addSublayer(separator)
        self.contaninerViewHeight += 7
        
        createButton(item)
    }
    
    @discardableResult
    private func createButton(_ item: ActionSheetItem) -> UIView {
        let btn = UIButton(type: .custom)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        if let image = item.image {
            btn.setTitle(" " + item.title , for: .normal)
            btn.setImage(image, for: .normal)
        } else {
            btn.setTitle(item.title, for: .normal)
        }
        
        var titleColor: UIColor
        var btnHeight: CGFloat
        var titleInsets: UIEdgeInsets = UIEdgeInsets.zero
        switch item.type {
        case .default:
            titleColor = .black
            btnHeight = itemHeight
        case .destructive:
            titleColor = .red
            btnHeight = itemHeight
        case .cancel:
            titleColor = .blue
            btnHeight = itemHeight + safeInsets.bottom
            titleInsets = UIEdgeInsets(top: -safeInsets.bottom/2, left: 0, bottom: safeInsets.bottom/2, right: 0)
        }
        
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleEdgeInsets = titleInsets
        
        if let btnDesc = item.desc {
            btn.frame = CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: itemHeight - 10)
            
            let tapBtn = UIButton(type: .custom)
            tapBtn.frame = CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: itemHeight + 15)
            tapBtn.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)

            let label = UILabel(frame: CGRect(x: 0, y: self.contaninerViewHeight + itemHeight - 10, width: UIScreen.main.bounds.width, height: 15))
            label.text = btnDesc
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            label.textAlignment = .center
            
            tapBtn.tag = item.index
            containerView.addSubview(btn)
            containerView.addSubview(label)
            containerView.addSubview(tapBtn)
            
            btnHeight = itemHeight + 15
            self.contaninerViewHeight += btnHeight
            return tapBtn
        } else {
            btn.tag = item.index
            btn.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
            btn.frame = CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: btnHeight)
            self.containerView.addSubview(btn)
            self.contaninerViewHeight += btnHeight
            return btn
        }
    }
    
    private func addLine() {
        let line = CALayer()
        line.frame = CGRect(x: 0, y: self.contaninerViewHeight, width: UIScreen.main.bounds.width, height: 1.0/UIScreen.main.scale)
        line.backgroundColor = UIColor(white: 0, alpha: 0.1).cgColor
        self.containerView.layer.addSublayer(line)
        self.contaninerViewHeight += 0.5
    }
    
    private var safeInsets: UIEdgeInsets {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    }
    
    private func setupCornerRadius(_ contentView: UIView) {
        if #available(iOS 11.0, *) {
            contentView.layer.cornerRadius = 15
            contentView.layer.masksToBounds = true
            contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            let path = UIBezierPath.init(roundedRect: contentView.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 15, height: 15))
            let shapLayer = CAShapeLayer()
            shapLayer.frame = contentView.bounds
            shapLayer.path = path.cgPath
            contentView.layer.mask = shapLayer
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    deinit {
//        print(#function)
//    }
}

typealias ActionSheetHandler = ((ActionSheetItem) -> Void)

class ActionSheetItem {
    
    enum ItemType {
        case `default`
        case destructive
        case cancel
    }
    
    var title: String
    var desc: String?
    var image: UIImage?
    fileprivate var titleColor: UIColor = UIColor.black
    fileprivate var font = UIFont.systemFont(ofSize: 17)
    fileprivate var type: ItemType = .default
    fileprivate var handler: ActionSheetHandler?
    fileprivate var index: NSInteger = 0
    
    init(title: String, desc: String? = nil, type: ItemType, handler: ActionSheetHandler?) {
        self.title = title
        self.desc = desc
        self.type = type
        self.handler = handler
    }
}
