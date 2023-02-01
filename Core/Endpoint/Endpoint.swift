//
//  Endpoint.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation

protocol Endpoint {
    
    associatedtype T: ServiceAPIRequest
    associatedtype V: Any
    
    var service: T { get }
    
    func sendRequest(with completion: @escaping (Result<V, Error>) -> Void)
}
