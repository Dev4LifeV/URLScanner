//
//  UsecaseGetURLScan.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
class UsecaseGetURLScan: Usecase {
    
    init() {
        service = ServiceGetAPIRequest<[CatImage]>(request: URLRequest(url: URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_8I4Q4nrAA0rVJS1YkxFx3ntym1cuLnwhF5nzjWd4DMVSk91ow9AE5fjEAxAPF6Q6")!))
        endpoint = EndpointGetURLScan(service: service)
    }
    
    internal let service: ServiceGetAPIRequest<[CatImage]>
    
    internal var endpoint: EndpointGetURLScan
    
    var dataProgress: Double!
    
    func callUsecase(with completion: @escaping (Result<[CatImage], Error>) -> Void) {
        
        endpoint.sendRequest(with: { result in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                print("Failed while fetching data: \(error)")
                completion(.failure(error))
            }
        })
    }
}
