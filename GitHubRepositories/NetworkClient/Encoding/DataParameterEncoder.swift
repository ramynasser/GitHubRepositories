//
//  DataParameterEncoder.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
public struct DataParameterEncoder: ParameterEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        var urlComponents = URLComponents()
        urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        urlRequest.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
    }
}
