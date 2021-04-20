//
//  BaseVC.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
import UIKit
protocol ViewControllerMiddleware {
    func setup()
    func setupViews()
    func setupTableView()
}

class BaseVC: UIViewController, ViewControllerMiddleware {
    func setupViews() {
        debugPrint("Will be overriden setupViews")
    }

    func setupNavigationBar() {
        debugPrint("Will be overriden setupNavigationBar")
    }

    func setupTableView() {}

    func setup() {
        setupTableView()
        setupViews()
        setupNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let viewGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(viewGesture)
    }

    @objc func endEditing() {
        view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// to make it optianl
extension ViewControllerMiddleware {
    func setupTableView() {}
}

extension BaseVC: BaseViewProtocol {
    func hideLoadingIndicator() {
        Loader.shared.hideActivityIndicator()
    }

    func showLoadingIndicator() {
        Loader.shared.showActivityIndicator(in: view)
    }

    func showMessageToast(message _: String?) {}
}
