//
//  URLSession+extension.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
public protocol URLSessionDataTaskProtocol {
    func resume()
    func suspend()
    func cancel()
}
public protocol URLSessionTaskProtocol {}
extension URLSessionTask: URLSessionTaskProtocol {}
extension URLSessionDataTask: URLSessionDataTaskProtocol {}
public protocol NetworkingSession {
    typealias CompletionHandler = (Response, Swift.Error?) -> Void
    func loadData(with urlRequest: URLRequest,
                  queue: DispatchQueue,
                  completionHandler: @escaping CompletionHandler) -> URLSessionDataTask

}
extension URLSession: NetworkingSession {
    public func loadData(with urlRequest: URLRequest,
                         queue: DispatchQueue,
                         completionHandler: @escaping (Response, Error?) -> Void) -> URLSessionDataTask {
        let task = dataTask(with: urlRequest) { data, urlResponse, error in
            queue.async {
                let response = Response(
                    urlRequest: urlRequest,
                    data: data,
                    httpURLResponse: urlResponse as? HTTPURLResponse
                )
                completionHandler(response, error)
            }
        }

        task.resume()
        return task
    }

}
