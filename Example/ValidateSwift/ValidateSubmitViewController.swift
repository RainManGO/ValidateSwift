//
//  ValidateSubmitViewController.swift
//  Validate_Example
//
//  Created by ZhangYu on 2019/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ValidateSwift

class ValidateSubmitViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension ValidateSubmitViewController:ValidateAble{

    @IBAction func submitBtnClick(_ sender: UIButton) {
        if checkSubmitView(self.view){
            ToastView().showToastExt(text: "可以进行下一步", pos: .Mid)
        }
    }

}
