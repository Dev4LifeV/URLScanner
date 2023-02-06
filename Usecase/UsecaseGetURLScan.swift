//
//  UsecaseGetURLScan.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
class UsecaseGetURLScan: Usecase {
        
    init() {
        service = ServiceGetAPIRequest<ScanResponse>()
        endpoint = EndpointGetURLScan(service: service)
    }
    
    internal let service: ServiceGetAPIRequest<ScanResponse>
    
    internal var endpoint: EndpointGetURLScan
    
    var dataProgress: Double!
    
    func callUsecase(with completion: @escaping (Result<ScanResponse, Error>) -> Void, params: Any? = nil) {
        
        guard let url = params as? String else {
            return
        }
        
        service.request = URLRequest(url: URL(string: "https://ipqualityscore.com/api/json/url/RidJl9FMPQ8m6ygqqDvtQD7dEBm5mav1/\(url)")!)
        
        endpoint.sendRequest(with: { result in
            switch result {
            case .success(let scan):
                completion(.success(scan))
            case .failure(let error):
                print("Failed while fetching data: \(error)")
                completion(.failure(error))
            }
        })
    }
}
