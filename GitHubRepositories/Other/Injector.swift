//
//  Injector.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

/**
 this class is to make Dependency injectionn to handle unit test
 */
import Foundation
public class Injector {
    public static var shared: Injector = Injector()

    func provideRepoPresenter() -> GitHubListViewPresenterProtocol {
        return GitHubListViewPresenter(service: Injector.shared.provideRepoGateway())
    }

    func provideRepoGateway() -> RepoGatewayProtocol {
        return RepoGateway()
    }

}
