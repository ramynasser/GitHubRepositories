//
//  BasePresenter.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
class BasePresenter: BasePresenterProtocol {
    private weak var view: BaseViewProtocol?

    // MARK: ViewProtocol methods

    func attachView(view: BaseViewProtocol) {
        self.view = view
        loadViewData()
    }

    func getView() -> BaseViewProtocol? {
        return view
    }

    func isViewAttached() -> Bool {
        return view != nil
    }

    func detachView() {
        view = nil
    }

    func loadViewData() {}

   

    
}
