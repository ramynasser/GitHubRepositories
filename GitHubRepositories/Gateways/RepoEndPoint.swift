//
//  RepoEndPoint.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
enum RepoEndPoint {
    case getRepos
}
extension RepoEndPoint: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }

    var path: String {
        return "repositories"
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        switch self {
        case .getRepos:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: nil)
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }

    var cachePolicy: CachePolicy {
        return .useProtocolCachePolicy
    }

}
