//
//  ValidateAble.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/19.
//

public protocol ValidateAble {

}

extension ValidateAble {

    /// 验证RulerText
    ///
    /// - Parameter rulerTexts:
    public func validateTexts(rulerTexts:[RulerText]) -> Bool{
        for rulerText in rulerTexts {
            if rulerText.text.validate(rulers: rulerText.rulers, emptyInfo:rulerText.requiredInfo) == false{
                return false
            }
        }
        return true
    }


    /// 验证textFiled 数组是否为空
    ///
    /// - Parameter textsArray:
    public func validateTexts(textsArray:[UITextField]) -> Bool{
        for text in textsArray {
            if text.validate(emptyInfo: nil) == false{
                return false
            }
        }
        return true
    }

    /// 验证一个页面所有的TextFelid
    /// 递归方法
    /// - Parameter submitParentview: 要验证的父控件
    /// - Returns: 阻塞
    public func checkSubmitView(_ submitParentview:UIView) -> Bool {

        for view in submitParentview.subviews {
            if view.isKind(of: UITextField.self){
                if let textFelid = view as? UITextField {
                    if textFelid.validate(emptyInfo: nil) == false{
                        return false
                    }
                }
            }else{
                if view.subviews.count > 0{
                    if checkSubmitView(view)  == false{
                        return false
                    }
                }else{
                    return true
                }
            }
        }
        return true
    }

}

