//
//  UIViewController+Extension.swift
//  OpenWeather
//
//  Created by Dre on 08.07.17.
//  Copyright © 2017 Dre. All rights reserved.
//

import UIKit
import BRYXBanner

extension UIViewController {
    
    // MARK: - BRYXBanner
    
    func showErrorBanner(message: String, position: BannerPosition) {
        removeBanner(tag: Constant.ViewTag.errorBanner)
        
        var shortMessage = message
        if message.characters.count > 200 {
            shortMessage = message.substring(to: message.index(message.startIndex, offsetBy: 200))
        }
        
        let banner = Banner(title: nil,
                            subtitle: shortMessage,
                            image: nil,
                            backgroundColor: UIColor.owLightRed)
        banner.tag = Constant.ViewTag.errorBanner
        banner.position = position
        banner.textColor = UIColor.owRedText
        banner.dismissesOnTap = true
        banner.dismissesOnSwipe = true
        banner.show(duration: 2.0)
    }
    
    func showInfoBanner(message: String, position: BannerPosition) {
        removeBanner(tag: Constant.ViewTag.infoBanner)
        
        var shortMessage = message
        if message.characters.count > 200 {
            shortMessage = message.substring(to: message.index(message.startIndex, offsetBy: 200))
        }
        
        let banner = Banner(title: nil,
                            subtitle: shortMessage,
                            image: nil,
                            backgroundColor: UIColor.owLightBlue)
        
        banner.tag = Constant.ViewTag.infoBanner
        banner.position = position
        banner.textColor = UIColor.owDarkBlue
        banner.dismissesOnTap = true
        banner.dismissesOnSwipe = true
        banner.show()
    }
    
    private func removeBanner(tag: Int) {
        if let topWindow = topWindow() {
            for view in topWindow.subviews {
                if view.tag == tag {
                    (view as! Banner).dismiss()
                }
            }
        }
    }
    
    private func topWindow() -> UIWindow? {
        for window in UIApplication.shared.windows.reversed() {
            if window.windowLevel == UIWindowLevelNormal && !window.isHidden && window.frame != CGRect.zero {
                return window
            }
        }
        return nil
    }
}
