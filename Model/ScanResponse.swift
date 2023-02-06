//
//  ScanResponse.swift
//  URLScanner
//
//  Created by Victor Proppe on 25/01/23.
//

import Foundation

struct ScanResponse: Decodable {
    var message: String = ""
    var success: Bool = false
    var unsafe: Bool = false
    var domain: String = ""
    var ip_address: String = ""
    var server: String = ""
    var content_type: String = ""
    var status_code: Int = 0
    var page_size: Int = 0
    var domain_rank: Int = 0
    var dns_valid: Bool = false
    var parking: Bool = false
    var spamming: Bool = false
    var malware: Bool = false
    var phishing: Bool = false
    var suspicious: Bool = false
    var adult: Bool = false
    var risk_score: Int = 0
    var category: String = ""
    var request_id: String = ""
    var asDictionary : [String: Any] {
        let mirror = Mirror(reflecting: self)
        
        var dictionary: [String: Any] = [:]
        
        mirror.children.forEach(
            {
                (label: String?, value: Any) in
                
                guard let label = label else {
                    return
                }
                
                dictionary[label] = value
            }
        )
            
        return dictionary
    }
}
