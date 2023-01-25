//
//  ScanResponse.swift
//  URLScanner
//
//  Created by Victor Proppe on 25/01/23.
//

import Foundation

struct ScanResponse {
    let message: String
    let success: Bool
    let unsafe: Bool
    let domain: String
    let ipAddress: String
    let server: String
    let contentType: String
    let statusCode: Int
    let pageSize: Int
    let domainRank: Int
    let dnsValid: Bool
    let parking: Bool
    let spamming: Bool
    let malware: Bool
    let phishing: Bool
    let suspicious: Bool
    let adult: Bool
    let riskScore: Int
    let domainAge: DomainAge
    let category: String
    let requestId: String
}

struct DomainAge {
    let human: String
    let timeStamp: Int
    let iso: String
}
