//
//  TextFelid+Validate.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/19.
//


extension UITextField{

   public func validate(emptyInfo: String?) -> Bool {
        if let textStr = self.text,textStr.isEmpty{
            var info = emptyInfo
            if emptyInfo == nil {
                if let placeholder  = self.placeholder {
                    info = placeholder
                } else {
                    info = "Incomplete data"
                }
            }
            if let infoStr = info{
                ToastView().showToastExt(text: infoStr, pos: .Bottom)
            }
            return false
        }
        return true
    }

}
