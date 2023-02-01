//
//  APIRequestError.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import Foundation
enum APIRequestError: Error {
    case snapshotNil
    case failedToDecodeData
    case failedToCompleteUsecaseOperation
    case failedToFetch
}
