# ValidateSwift

[![CI Status](https://img.shields.io/travis/776210576@qq.com/ValidateSwift.svg?style=flat)](https://travis-ci.org/776210576@qq.com/ValidateSwift)
<a href="https://github.com/GTMYang/GTMRefresh"><img src="https://img.shields.io/badge/language-Swift%204-orange.svg"></a>
[![Version](https://img.shields.io/cocoapods/v/ValidateSwift.svg?style=flat)](https://cocoapods.org/pods/ValidateSwift)
[![License](https://img.shields.io/cocoapods/l/ValidateSwift.svg?style=flat)](https://cocoapods.org/pods/ValidateSwift)
[![Platform](https://img.shields.io/cocoapods/p/ValidateSwift.svg?style=flat)](https://cocoapods.org/pods/ValidateSwift)

![image](https://github.com/RainManGO/ValidateSwift/blob/master/Validate1.gif)



## 简介

使用起来超级简单的text验证框架，从此远离一堆代码验证一个表单。



## 示例

详细例子可以运行示例程序查看，克隆这个仓库，在Example文件夹下执行`pod install`



## 支持

- iOS 8.0
- Swift4.0+



## CocoaPods安装

Podfile里添加：

```ruby
pod 'ValidateSwift'
```



## 使用



### 单个TextFlied

- 如果只需要验空

  ```swift
  passwordText.validate(emptyInfo: "请输入XX")
  ```

   emptyInfo参数可以不填，默认提示placeholder

- 规则验证

  ```swift
   phoneText.validate(rulers: [Rulers.required,Rulers.phone]
  ```



### 多个TextFlied

首先需要遵守`ValidateAble`协议

```swift
class ValidateArrayViewController:ValidateAble{

}
```



- 如果只需要验空

  ```swift
   if validateTexts(textsArray: [nameText,phoneText,emailText]){
         
   }
  ```

  更简单的方式，你还可以使用：(会深度遍历所有self.view的子TextFlied，如果没有就提示placeholder)

  ```swift
  if checkSubmitView(self.view){
              
  }
  ```

  

- 规则验证

  ```swift
  if validateTexts(rulerTexts: getRulerText()) {
             
  }
  
  func getRulerText() -> [RulerText] {
           let passwordRulerText = RulerText.init(textfelid: passwordText, textRulers: [Rulers.required,Rulers.okpwd], emptyInfo: "请输入密码")
  
          let phoneRulerText = RulerText.init(textfelid: phoneText, textRulers: [Rulers.required,Rulers.phone])
  
          let emailRulerText = RulerText.init(textfelid: emailText, textRulers: [Rulers.required,Rulers.email])
  
          let idcardRulerText = RulerText.init(textfelid: idcardText, textRulers: [Rulers.required,Rulers.idcard])
  
          let numberRulerText = RulerText.init(textfelid: numberText, textRulers: [Rulers.number])
  
          return [passwordRulerText,phoneRulerText,emailRulerText,idcardRulerText,numberRulerText]
   }
  
  ```

  

### 目前支持规则

```swift
public enum Rulers:Int{
    case required = 0
    case phone
    case email
    case okpwd
    case idcard
    case bankcard
    case number
}
```

希望可以共同维护，遇到的多种规则，让它越来越强大，让验证越来越简单。



## License

ValidateSwift is available under the MIT license. See the LICENSE file for more info.
