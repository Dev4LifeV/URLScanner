//
//  GetAPIRequestService.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
class ServiceGetAPIRequest<T: Decodable>: ServiceAPIRequest {
    
    init(request: URLRequest) {
        self.request = request
    }
    
    internal var decoder = JSONDecoder()
    internal var request: URLRequest
    
    var obs: NSKeyValueObservation!
    
    
    func sendRequest(with completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error in
            
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let snapshot = data else {
                completion(.failure(APIRequestError.snapshotNil))
                return
            }
            
            do {
                let dataDecoded: T =  try strongSelf.decoder.decode(T.self, from: snapshot)
                
                completion(.success(dataDecoded))
            } catch {
                completion(.failure(APIRequestError.failedToDecodeData))
            }
        })
        
        obs = task.progress.observe(\.fractionCompleted, changeHandler: { progress, observer in
            
            NotificationCenter.default.post(name: Notification.Name("progress"), object: nil, userInfo: ["progress": progress.fractionCompleted])
    
        })
        task.resume()
    }
    
    
}
