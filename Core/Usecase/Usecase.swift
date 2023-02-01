//
//  UsecaseGetURLScan.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
protocol Usecase {
    
    associatedtype S: ServiceAPIRequest
    associatedtype E: Endpoint
    associatedtype T: Any
    
    var service: S { get }
    
    var endpoint: E { get }
    
    func callUsecase(with completion: @escaping (Result<T, Error>) -> Void)
}
