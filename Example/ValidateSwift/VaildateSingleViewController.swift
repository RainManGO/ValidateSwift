//
//  VaildateSingleViewController.swift
//  Validate_Example
//
//  Created by ZhangYu on 2019/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ValidateSwift

class VaildateSingleViewController: UIViewController {

    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func submitBtnClick(_ sender: UIButton) {
        if accountText.validate(emptyInfo: nil) &&
            passwordText.validate(emptyInfo: "请输入密码"){
            ToastView().showToastExt(text: "表单数据完整可以登录", pos: .Mid)
        }
    }

}
