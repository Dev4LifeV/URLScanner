//
//  ScanResponse.swift
//  URLScanner
//
//  Created by Victor Proppe on 25/01/23.
//

import Foundation

struct ScanResponse {
    var message: String = ""
    var success: Bool = false
    var unsafe: Bool = false
    var domain: String = ""
    var ipAddress: String = ""
    var server: String = ""
    var contentType: String = ""
    var statusCode: Int = 0
    var pageSize: Int = 0
    var domainRank: Int = 0
    var dnsValid: Bool = false
    var parking: Bool = false
    var spamming: Bool = false
    var malware: Bool = false
    var phishing: Bool = false
    var suspicious: Bool = false
    var adult: Bool = false
    var riskScore: Int = 0
    var category: String = ""
    var requestId: String = ""
    
    var asDictionary : [String: Any] {
        let mirror = Mirror(reflecting: self)
        
        let dict = Dictionary(
            uniqueKeysWithValues: mirror.children.lazy.map(
                {
                    (label: String?, value: Any) -> (String, Any)? in
                    
                    guard let label = label else {
                        return nil
                    }
                    
                    return (label, value)
                }
            ).compactMap { $0 })
        
        return dict
        
    }
}
