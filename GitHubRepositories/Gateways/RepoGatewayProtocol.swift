//
//  RepoGatewayProtocol.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
typealias FetchReposCompletionHandler = (_ repos: [GithubRepo]?, _ error: NetworkingError?) -> Void

protocol RepoGatewayProtocol{
    func getRepos(completion: @escaping FetchReposCompletionHandler)
}
struct RepoGateway: RepoGatewayProtocol {
    let network = NetworkClient<RepoEndPoint>()
    
    func getRepos(completion: @escaping FetchReposCompletionHandler) {
        network.request(service: .getRepos) { result in
            switch result {
            case .success(let response):
                guard let model = try? response.map(to: [GithubRepo].self) else{
                    completion(nil, .unknown)
                    return
                }
                
                completion(model, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
