//
//  SingleRulerValidateViewController.swift
//  ValidateSwift_Example
//
//  Created by ZhangYu on 2019/4/20.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ValidateSwift

class SingleRulerValidateViewController: UIViewController {
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var idcardText: UITextField!
    @IBOutlet weak var numberText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func submitBtnClick(_ sender: UIButton) {
        if  passwordText.validate(rulers: [Rulers.required,Rulers.okpwd]) &&
            phoneText.validate(rulers: [Rulers.required,Rulers.phone]) &&
            emailText.validate(rulers: [Rulers.required,Rulers.email]) &&
            idcardText.validate(rulers: [Rulers.required,Rulers.idcard]) &&
            numberText.validate(rulers: [Rulers.number]){
            ToastView().showToastExt(text: "表单完整，可以提交", pos: .Mid)
        }

    }
}



