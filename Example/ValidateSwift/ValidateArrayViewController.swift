//
//  ValidateArrayViewController.swift
//  Validate_Example
//
//  Created by ZhangYu on 2019/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ValidateSwift

class ValidateArrayViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension ValidateArrayViewController:ValidateAble{

    @IBAction func submitBtnClick(_ sender: UIButton) {
        if validateTexts(textsArray: [nameText,phoneText,emailText]){
            ToastView().showToastExt(text: "可以进行下一步", pos: .Mid)
        }
    }

}
