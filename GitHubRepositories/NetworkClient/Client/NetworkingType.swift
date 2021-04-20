//
//  NetworkingType.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
public typealias ResponseCompletion = (Result<Response, NetworkingError>) -> Void

public protocol NetworkingType {

    associatedtype Service

    func request(
        service: Service,
        session: NetworkingSession,
        queue: DispatchQueue,
        completion: @escaping ResponseCompletion
        )

   

}
