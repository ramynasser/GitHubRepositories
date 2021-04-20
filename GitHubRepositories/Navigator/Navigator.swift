//
//  Navigator.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//


import Foundation
import UIKit
enum NavigationTarget {
    case listMovie
    case addMovie
    var viewController: UIViewController? {
        var viewController: UIViewController?
        switch self {
        case .listMovie:
            let vc = UIViewController()
            viewController = vc
        case .addMovie:
            let vc = UIViewController()
            viewController = vc
        }
        return viewController
    }

   
}

class Navigator {


   
    static var rootViewController = UIApplication.topViewController()?.navigationController
    
    class func navigate(to navigationTarget: NavigationTarget ) {
        if let destinationVC = navigationTarget.viewController {
            DispatchQueue.main.async {
                Navigator.rootViewController?.pushViewController(destinationVC, animated: true)
            }
        }
    }
    
    class func pop(to navigationTarget: NavigationTarget?,popToRoot: Bool = false) {
        guard let vc = navigationTarget?.viewController else {
            if popToRoot {
                rootViewController?.popToRootViewController(animated: true)
            } else {
                rootViewController?.popViewController(animated: true)
            }
            return
        }
        rootViewController?.popToViewController(vc, animated: true)
    }
    
    class func present(navigationTarget: NavigationTarget ,completion:(() -> Void)?) {
        guard let vc = navigationTarget.viewController else {
            return
        }
        rootViewController?.present(vc, animated: true, completion: completion)
    }
    
    class func dismiss(navigationTarget: NavigationTarget? ,completion:(() -> Void)?) {
        guard let vc = navigationTarget?.viewController else {
            rootViewController?.dismiss(animated: true, completion: completion)
            return
        }
        vc.dismiss(animated: true, completion: completion)
    }
    
    class func setRoot(target navigationTarget: NavigationTarget,in window: UIWindow?) {
        guard  let appWindow = window else {
            return
        }
        if let viewController = navigationTarget.viewController {
            let nav = UINavigationController(rootViewController: viewController)
            appWindow.rootViewController = nav
            rootViewController = nav
            appWindow.makeKeyAndVisible()
        }
    }
}
