//
//  HTTPTask.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    case requestPlain

    case requestParameters(bodyParameters: Parameters?,
                           bodyEncoding: ParameterEncoding,
                           urlParameters: Parameters?)
}
extension  HTTPTask {
    var bodyParameters: Parameters? {
        switch self {
        case .requestPlain:
            return nil
        case let .requestParameters(bodyParameters, _, _):
            return bodyParameters
        }
    }

    var urlParameters: Parameters? {
        switch self {
        case .requestPlain:
            return nil
        case let .requestParameters(_, _, urlParameters):
            return urlParameters
        }
    }

}
