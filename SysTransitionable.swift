//
//  NavAnimationable.swift
//  ToonanGuard
//
//  Created by leophy on 2017/4/28.
//  Copyright © 2017年 toonan. All rights reserved.
//

import Foundation

protocol SysTransitionable : class {

    func pushViewController(_ viewController:UIViewController,animated : Bool ,sysTransition type:SysTransitionType)
    
    func pushViewController(_ viewController:UIViewController,animated : Bool ,sysTransition config:(_ transiton : CATransition)->CATransition)
    
    func popViewController(animated: Bool ,sysTransition type:SysTransitionType ) -> UIViewController?
    
    func popViewController(animated: Bool ,sysTransition config:(_ transiton : CATransition)->CATransition) -> UIViewController?
}

extension SysTransitionable where Self : UINavigationController {

    /// push : select animation type
    func pushViewController(_ viewController:UIViewController,animated : Bool = true ,sysTransition type:SysTransitionType = .fade) {
        
        if animated == false {
            view.layer.add(SysTransition.share.transition(type), forKey: nil)
        }
        pushViewController(viewController, animated: animated)
    }
    
    /// push : custom animation
    func pushViewController(_ viewController:UIViewController,animated : Bool = true ,sysTransition config:(_ transiton : CATransition)->CATransition) {
        
        if animated == false {
            let anim = config(SysTransition.share.transition(config: {
                (transition) -> CATransition in
                return transition
            }))
            
            view.layer.add(anim, forKey: nil)
        }
        pushViewController(viewController, animated: animated)
    }
    
    /// pop : select animation type
    func popViewController(animated: Bool = true,sysTransition type:SysTransitionType = .fade) -> UIViewController? {
        if animated == false {
            view.layer.add(SysTransition.share.transition(type), forKey: nil)
        }
        return popViewController(animated: animated)
    }
    
    /// pop : custom animation
    func popViewController(animated: Bool ,sysTransition config:(_ transiton : CATransition)->CATransition) -> UIViewController? {
        if animated == false {
            let anim = config(SysTransition.share.transition(config: {
                (transition) -> CATransition in
                return transition
            }))
            view.layer.add(anim, forKey: nil)
        }
        return popViewController(animated: animated)
    }
}
