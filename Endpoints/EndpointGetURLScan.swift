//
//  EndpointScanURL.swift
//  URLScanner
//
//  Created by Victor Proppe on 25/01/23.
//

import Foundation

class EndpointGetURLScan: Endpoint {

    init(service: ServiceGetAPIRequest<[CatImage]>) {
        self.service = service
    }
    
    let service: ServiceGetAPIRequest<[CatImage]>
    
    func sendRequest(with completion: @escaping (Result<[CatImage], Error>) -> Void) {
        
        service.sendRequest(with: { result in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(APIRequestError.failedToFetch))
                print("Error obtaining data \(error)")
            }
        })
    }
}
