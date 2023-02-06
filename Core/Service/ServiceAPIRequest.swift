//
//  ServiceAPIRequest.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
import Combine

protocol ServiceAPIRequest {
    associatedtype T: Decodable
    
    var decoder: JSONDecoder { get }
    var request: URLRequest! { get set }
    
    func sendRequest(with completion: @escaping (Result<T, Error>) -> Void)
}
