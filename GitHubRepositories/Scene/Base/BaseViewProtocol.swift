//
//  BaseViewProtocol.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
protocol BaseViewProtocol: class {
    func hideLoadingIndicator()
    func showLoadingIndicator()
    func showMessageToast(message: String?)
}
