//
//  ItemCell.swift
//  test01
//
//  Created by dong on 2020/12/19.
//

import UIKit


/**
 1、禁止复制、粘贴、选择
 2、输入金额 整数保留6位，小数后2位
 */
class PressTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        UIMenuController.shared.isMenuVisible = false
        return false
    }

}

extension XXXClass: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currStr = textField.text else { return false }
        
        // 遇到删除，直接进行
        if string == "" { return true }
        
        // 输入.，变为0.
        if currStr.count == 0 && string == "."{
            textField.text = "0."
            return false
        }
        
        // 只允许输入一个.
        if string == "." {
            return !currStr.contains(".")
        }
        
        // 首位为0，要么跟.，要么替换
        if currStr == "0" {
            if string.count == 0 || string == "." {
                return true
            } else {
                textField.text = string
                return false
            }
        }
        
        // 保留小数点前6位，后2位
        let arr = currStr.components(separatedBy: ".")
        let firstStr = arr.first ?? ""
        let secondStr = arr.count == 2 ? arr.last ?? "" : ""
        
        if range.location <= firstStr.count {
            return firstStr.count < 6
        } else {
            return secondStr.count < 2
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let inputText = textField.text else { return }
        if inputText.count == 0 { return }
        let valueItem = inputText.double.roundToDouble(2)
        moneyTextField.text = String(format:"%.2f", valueItem)
        self.endEditMoney?(valueItem)
    }
}
