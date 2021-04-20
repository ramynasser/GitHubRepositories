//
//  NetworkingError.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation

public enum NetworkingError: Error {
    case noData(Response)
    case statusCode(Response)
    case decoding(Error, Response)
    case underlying(Error, Response?)
    case unknown
}


extension NetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noData:
            return "The request gave no data."
        case .statusCode:
            return "Status code didn't fall within the given range."
        case .decoding:
            return "Failed to map data to a Decodable object."
        case let .underlying(error, _):
            return error.localizedDescription
        case .unknown:
            return "Failed to build request"
        }
    }
}
