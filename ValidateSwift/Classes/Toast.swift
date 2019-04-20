//
//  Toast.swift
//  Pods
//
//  Created by ZhangYu on 2019/4/19.
//

public class ToastView: NSObject {
    var delay: Double = 3.0  //延迟时间
    var bufWindows: [UIWindow] = []    //缓存window

    //显示位置
    public enum Position: Int {
        case Top
        case Mid
        case Bottom
    }

    //显示toast
    public func showToast(text: String, pos: Position) {
        let rootRect = UIApplication.shared.windows.first?.frame   //应用屏幕大小

        let container = UIView()   //全屏且透明，盖在最上面， 可以自定义点击事件， 从而实现模态和非模态框效果。
        container.backgroundColor = UIColor.clear
        container.frame = rootRect!

        let lableView = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        lableView.font = UIFont.systemFont(ofSize: 13)
        lableView.textColor = UIColor.white
        lableView.text = text
        lableView.textAlignment = .center
        lableView.numberOfLines = 0
        let rect = lableView.getLableSize(text: text, maxWidth: 300)

        let bgView = UIView()
        bgView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.8)
        bgView.layer.cornerRadius = 10
        var bgRect: CGRect    //黑色半透明背景

        switch pos {
        case .Bottom:
            lableView.frame = CGRect(x: (rootRect?.width)!/2 - rect.width/2,
                                     y: (rootRect?.height)! - rect.height - 30 ,
                                     width: rect.width,
                                     height: rect.height)
            bgRect = CGRect(x: lableView.frame.minX - 5,
                            y: lableView.frame.minY - 5,
                            width: rect.width + 10,
                            height: rect.height + 10)
        case .Mid:
            lableView.frame = CGRect(x: (rootRect?.width)!/2 - rect.width/2,
                                     y: (rootRect?.height)!/2 - rect.height/2 ,
                                     width: rect.width,
                                     height: rect.height)
            bgRect = CGRect(x: lableView.frame.minX - 5,
                            y: lableView.frame.minY - 5,
                            width: rect.width + 10,
                            height: rect.height + 10)
        case .Top:
            lableView.frame = CGRect(x: (rootRect?.width)!/2 - rect.width/2,
                                     y: 80,
                                     width: rect.width,
                                     height: rect.height)

            bgRect = CGRect(x: lableView.frame.minX - 5,
                            y: lableView.frame.minY - 5,
                            width: rect.width + 10,
                            height: rect.height + 10)
        }
        bgView.frame = bgRect

        container.addSubview(bgView)
        container.addSubview(lableView)  //添加lableView

        let window = UIWindow()
        window.backgroundColor = UIColor.clear
        window.frame = rootRect!
        window.center = container.center
        window.windowLevel = UIWindowLevelAlert
        window.isHidden = false
        window.addSubview(container)

        //添加点击事件
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:))))

        bufWindows.append(window)
        perform(#selector(showFinished(sender:)), with: window, afterDelay: delay)
    }


    //显示toast，非模态
    public func showToastExt(text: String, pos: Position) {
        let rootRect = UIApplication.shared.windows.first?.frame   //应用屏幕大小

        let lableView = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        lableView.font = UIFont.systemFont(ofSize: 15)
        lableView.textColor = UIColor.white
        lableView.text = text
        lableView.textAlignment = .center
        lableView.numberOfLines = 1

        let rectLable = lableView.getLableSize(text: text, maxWidth: 300)  //行高

        let bgView = UIView()
        bgView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.8)
        bgView.layer.cornerRadius = 10
        var bgRect: CGRect    //黑色半透明背景
        var windowRect: CGRect //window的位置
        var windowCenter: CGPoint

        bgRect = CGRect(x: 0, y: 0, width: rectLable.width + 10, height: rectLable.height + 10)
        switch pos {
        case .Bottom:
            windowRect = CGRect(x: (rootRect?.width)!/2 - rectLable.width/2 - 10,
                                y: (rootRect?.height)! - rectLable.height - 30,
                                width: rectLable.width + 10,
                                height: rectLable.height + 10)
            windowCenter = CGPoint(x: (rootRect?.width)!/2, y: (rootRect?.height)! - 30 - rectLable.height/2 - 5)
        case .Mid:
            windowRect = CGRect(x: (rootRect?.width)!/2 - rectLable.width/2 - 5,
                                y: (rootRect?.height)!/2 - rectLable.height/2 - 5,
                                width: rectLable.width + 10,
                                height: rectLable.height + 10)
            windowCenter = CGPoint(x: (rootRect?.width)!/2, y: (rootRect?.height)!/2)
        case .Top:
            windowRect = CGRect(x: (rootRect?.width)!/2 - rectLable.width/2 - 5,
                                y: 50,
                                width: rectLable.width + 10,
                                height: rectLable.height + 10)
            windowCenter = CGPoint(x: (rootRect?.width)!/2, y: 50 + 5 + rectLable.height/2)
        }
        bgView.frame = CGRect(x: 0,
                              y: 0,
                              width: bgRect.width + 10,
                              height: bgRect.height + 10)
        lableView.frame = CGRect(x: bgView.frame.width/2 - rectLable.width/2,
                                 y: bgView.frame.height/2 - rectLable.height/2,
                                 width: rectLable.width,
                                 height: rectLable.height)

        bgView.addSubview(lableView)  //添加lableView


        let window = UIWindow()
        window.backgroundColor = UIColor.clear
        window.frame = windowRect
        window.center = windowCenter
        window.windowLevel = UIWindowLevelAlert
        window.isHidden = false
        window.addSubview(bgView)

        //添加点击事件
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapGesture(sender:))))

        bufWindows.append(window)
        perform(#selector(showFinished(sender:)), with: window, afterDelay: delay)
    }

    //添加点击事件
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        //移除最后一个
        if bufWindows.count > 0 {
            bufWindows.removeLast()
        }
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }

    //toast超时关闭
    @objc func showFinished(sender: AnyObject) {
        if let window = sender as? UIWindow {
            if let index = bufWindows.index(of: window) {
                bufWindows.remove(at: index)  //删除
            }
        } else {
            //do nothing
        }
    }
}



extension UILabel {
    //根据最大宽度计算宽高
    func getLableSize(text: String, maxWidth: CGFloat) -> CGRect {
        let maxSize = CGSize(width: maxWidth, height: 0)   //注意高度是0
        //    size = text.boundingRectWithSize(size2, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes , context: nil);
        let size = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font:self.font], context: nil)
        return size

    }
}
