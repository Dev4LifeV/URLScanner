//
//  String.swift
//  URLScanner
//
//  Created by Victor Proppe on 06/02/23.
//

import Foundation

extension String {
    func trim() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func formatModelKey() -> String {
        return self.replacingOccurrences(of: "_", with: " ").capitalized
    }
}
