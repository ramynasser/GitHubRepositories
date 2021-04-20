//
//  NetworkClient.swift
//  GitHubRepositories
//
//  Created by Ramy Nasser on 4/20/21.
//  Copyright © 2021 Ramy Nasser. All rights reserved.
//

import Foundation
import Foundation
public typealias NetworkTask = (service: EndPointType?, sessionData: URLSessionDataTaskProtocol?)

open class NetworkClient<R: EndPointType>: NetworkingType {
    private var networkTasks: [NetworkTask] = []
    private let networkQueue =  DispatchQueue(
        label: "com.instabug.InstabugNetworkClient",
        attributes: .concurrent)
    public init() {}
    public func request(
        service: R,
        session: NetworkingSession = URLSession.shared,
        queue: DispatchQueue = .main,
        completion: @escaping ResponseCompletion
    ) {
        do {
            let request = try NetworkRequest(endPoint: service).buildRequest()
            let sessionData = session.loadData(with: request, queue: queue) { response, error in
                
                
                if let error = error {
                    queue.async {
                        completion(.failure(.underlying(error, response)))
                    }
                }
                
                guard let httpURLResponse = response.httpURLResponse,
                    200..<300 ~= httpURLResponse.statusCode else {
                        queue.async {
                            completion(.failure(.statusCode(response)))
                        }
                        return
                }
                
                queue.async {
                    completion(.success(response))
                }
                
            }
            networkQueue.async(flags: .barrier) {
                let task = NetworkTask(service: service, sessionData: sessionData)
                self.networkTasks.append(task)
            }
            
        } catch {
            queue.async {
                completion(.failure(.unknown))
            }
        }
        
    }
    
    
    
    
}
