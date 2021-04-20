//
//  GitHubListViewPresenter.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
protocol GitHubListViewPresenterProtocol {
    func fetchGitHubRepositories()
    func getRepo(at index: Int) -> Any
    func getNumberOfRowsInSection(at section: Int) -> Int
    func getNumberOfSection() -> Int
}
class GitHubListViewPresenter: BasePresenter,GitHubListViewPresenterProtocol {
    func fetchGitHubRepositories() {
        service.getRepos { (repos, error) in
            guard let repos = repos else {
                return
            }
            print(repos.first?.owner?.login)
        }
    }
    
    func getRepo(at index: Int) -> Any {
        return 1
    }
    
    func getNumberOfRowsInSection(at section: Int) -> Int {
        return 4
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    var service: RepoGatewayProtocol!
    
    init(service: RepoGatewayProtocol) {
        super.init()
        self.service = service
    }
}
