//
//  TextView+Validate.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/19.
//

extension UITextView{

    public func validate(emptyInfo: String?) -> Bool {
        if let textStr = self.text,textStr.isEmpty{
            var info = emptyInfo
            if emptyInfo == nil {
                info = "Incomplete data"
            }
            if let infoStr = info{
                ToastView().showToastExt(text: infoStr, pos: .Bottom)
            }
            return false
        }
        return true
    }

}

