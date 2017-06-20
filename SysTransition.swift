//
//  TNTransition.swift
//  ToonanGuard
//
//  Created by leophy on 2017/4/27.
//  Copyright © 2017年 toonan. All rights reserved.
//

import UIKit

/*
 cube                   立方体效果
 pageCurl               向上翻一页
 pageUnCurl             向下翻一页
 rippleEffect           水滴波动效果
 suckEffect             变成小布块飞走的感觉
 oglFlip                上下翻转
 cameraIrisHollowClose  相机镜头关闭效果
 cameraIrisHollowOpen   相机镜头打开效果
 */

enum SysTransitionType : String {

    case fade           = "fade"    // Default
    case moveIn         = "moveIn"
    case push           = "push"
    case reveal         = "reveal"
    case cube           = "cube"
    case pageCurl       = "pageCurl"
    case pageUnCurl     = "pageUnCurl"
    case rippleEffect   = "rippleEffect"
    case suckEffect     = "suckEffect"
    case oglFlip        = "oglFlip"
    case cameraIrisHollowClose = "cameraIrisHollowClose"
    case cameraIrisHollowOpen  = "cameraIrisHollowOpen"
}

enum SysTransitionSubType : String {
    case fromRight  = "fromRight"
    case fromLeft   = "fromLeft"
    case fromTop    = "fromTop"
    case fromBottom = "fromBottom"
}

class SysTransition {
    
    public static let share = SysTransition()
    private init(){}

    func transition(_ type:SysTransitionType = .fade,subType:SysTransitionSubType? = nil, duration:CFTimeInterval = 0.5) -> CATransition {
        
        let transition = CATransition()
        transition.duration = duration
        transition.type = type.rawValue
        if subType != nil {
            transition.subtype = subType?.rawValue
        }
        return transition
    }
    
    func transition(config:((CATransition)->CATransition)) -> CATransition {
        let transition = CATransition()
        return config(transition)
    }
}
