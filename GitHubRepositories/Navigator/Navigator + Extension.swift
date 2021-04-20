//
//  Navigator + Extension.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//


import Foundation
import UIKit

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let tableVC = base as? UITableViewController {
            return topViewController(tableVC)
        }

        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        if let root = base {
            return topViewController((root.children.first as? UINavigationController)?.topViewController)
        }

        return base
    }
}
