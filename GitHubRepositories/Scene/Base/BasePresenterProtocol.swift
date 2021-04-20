//
//  BasePresenterProtocol.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
import Foundation
protocol BasePresenterProtocol: class {
    /**
     * Set or attach the view to this presenter
     */
    func attachView(view: BaseViewProtocol)

    /**
     * Get the attached view. You should always call {@link #isViewAttached()} to check if the view
     * is
     * attached to avoid NullPointerExceptions
     */
    func getView() -> BaseViewProtocol?

    /**
     * Checks if a view is attached to this presenter. You should always call this method before
     */
    func isViewAttached() -> Bool

    /**
     * Will be called if the view controller has been destroyed. Typically this method will be invoked from
     */
    func detachView()

    /**
     * Load the data. Typically invokes the service method to load the desired data.
     */
    func loadViewData()
}
