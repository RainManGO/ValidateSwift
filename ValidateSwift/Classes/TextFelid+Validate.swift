//
//  TextFelid+Validate.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/19.
//

extension UITextField{

   public func validate(emptyInfo: String?) -> Bool {
        if let textStr = self.text,textStr.isEmpty == false{
            return true
        }else{
            var info = emptyInfo
            if emptyInfo == nil {
                if let placeholder  = self.placeholder {
                    info = placeholder
                } else {
                    info = emptyErrorInfo                }
            }
            if let infoStr = info{
                ToastView().showToastExt(text: infoStr, pos: .Bottom)
            }
            return false
        }
    }

    public func validate(rulers:[Rulers],emptyInfo:String? = nil) -> Bool{
        let text = self.text ?? ""
        for ruler in rulers {
            switch ruler{
                case .required:
                    if validate(emptyInfo: emptyInfo) == false{
                        return false
                    }
                case .okpwd,.email,.phone,.bankcard:
                    if ValidateRulers.validateRegex(text: text, regex: ruler.rulerRegex) == false{
                        ToastView().showToastExt(text: ruler.errorDesp, pos: .Bottom)
                        return false
                    }
                case .idcard:
                    if ValidateRulers.isTrueIDNumber(text: text) == false{
                        ToastView().showToastExt(text: ruler.errorDesp, pos: .Bottom)
                        return false
                    }
                case .number:
                    if ValidateRulers.isNumber(text) == false {
                        ToastView().showToastExt(text: ruler.errorDesp, pos: .Bottom)
                        return false
                    }
            }
        }
        return true
    }
}
