//
//  Constants.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/20.
//


//MARK: - 正则表达式

public let emailRegex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"

public let phoneRegex = "^1[3|4|5|6|7|8|9][0-9]\\d{8}$"

public let bankRegex = "(^\\d{19}$)|(^\\d{19}-\\d{4}$)|(^\\d{20}$)|(^\\d{16}$)|(^\\d{20}-\\d{4}$)"

public let goodPwdRegex = "(^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$)"


//MARK: - 规则默认提示词

public let emptyErrorInfo = "输入信息不完整"

public let phoneErrorInfo = "请输入正确的手机号"

public let emailErrorInfo = "请输入正确的邮箱"

public let okpwdErrorInfo = "请输入符合规则的密码"

public let idcardErrorInfo = "请输入正确身份证号"

public let bankcardErrorInfo = "请输入正确的银行卡号"

public let numberErrorInfo = "请输入正确数字"
