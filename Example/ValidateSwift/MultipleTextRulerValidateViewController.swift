//
//  MultipleTextRulerValidateViewController.swift
//  ValidateSwift_Example
//
//  Created by ZhangYu on 2019/4/20.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ValidateSwift

class MultipleTextRulerValidateViewController: UIViewController {

    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var idcardText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

extension MultipleTextRulerValidateViewController:ValidateAble{

    @IBAction func submitBtnClick(_ sender: UIButton) {
        if validateTexts(rulerTexts: getRulerText()) {
            ToastView().showToastExt(text: "表单完整，可以提交", pos: .Mid)
        }
    }


    func getRulerText() -> [RulerText] {
         let passwordRulerText = RulerText.init(textfelid: passwordText, textRulers: [Rulers.required,Rulers.okpwd], emptyInfo: "请输入密码")

        let phoneRulerText = RulerText.init(textfelid: phoneText, textRulers: [Rulers.required,Rulers.phone])

        let emailRulerText = RulerText.init(textfelid: emailText, textRulers: [Rulers.required,Rulers.email])

        let idcardRulerText = RulerText.init(textfelid: idcardText, textRulers: [Rulers.required,Rulers.idcard])

        let numberRulerText = RulerText.init(textfelid: numberText, textRulers: [Rulers.number])

        return [passwordRulerText,phoneRulerText,emailRulerText,idcardRulerText,numberRulerText]
    }
}
