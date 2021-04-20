//
//  URLRequest+extension.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation

public protocol NetworkRequestProtocol {
    var endPoint: EndPointType {get set}
    var timeout: TimeInterval {get set}
    func buildRequest() throws -> URLRequest
}
public struct NetworkRequest: NetworkRequestProtocol {
    public var endPoint: EndPointType
    public var timeout: TimeInterval
    
    init(endPoint: EndPointType, timeout: TimeInterval = NetworkConstants.timeOut) {
        self.endPoint = endPoint
        self.timeout = timeout
    }
    public func buildRequest() throws -> URLRequest {
        var request = URLRequest(url: endPoint.baseURL.appendingPathComponent(endPoint.path),
                                 cachePolicy: endPoint.cachePolicy,
                                 timeoutInterval: timeout)
        
        request.httpMethod = endPoint.httpMethod.rawValue
        do {
            switch endPoint.task {
            case .requestPlain:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case let .requestParameters(bodyParameters,
                                        bodyEncoding,
                                        urlParameters):
                if let headers = endPoint.headers {
                    addAdditionalHeaders(headers,
                                         request: &request)
                }
                try buildParameters(bodyParameters: bodyParameters,
                                    bodyEncoding: bodyEncoding,
                                    urlParameters: urlParameters,
                                    request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
}
// MARK: - build Parameters
extension NetworkRequest {
    private func buildParameters(bodyParameters: Parameters?,
                                 bodyEncoding: ParameterEncoding,
                                 urlParameters: Parameters?,
                                 request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(
                urlRequest: &request,
                bodyParameters: bodyParameters,
                urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
}
// MARK: - build Headers
extension NetworkRequest {
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
