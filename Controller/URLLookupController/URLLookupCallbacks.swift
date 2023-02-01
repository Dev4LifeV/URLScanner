//
//  URLLookupCallbacks.swift
//  URLScanner
//
//  Created by Victor Proppe on 01/02/23.
//

import Foundation

extension URLLookupViewController {
    
    @objc func updateProgress(_ notification: Notification) {
        guard let progress = notification.userInfo?["progress"] as? Double else {
            return
        }
        
        DispatchQueue.main.async {
            self.circularProgress.progress = progress
        }
    }
    
    @objc func fetchImage() {
        
        buttonClicked = true
        self.circularProgress.timeToFill = 2
        
        usecaseGetURLScan.callUsecase(with: { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let cats):
                print(cats.map(\.url))
                DispatchQueue.main.asyncAfter(deadline: .now() + strongSelf.circularProgress.timeToFill) { [weak self] in
                    
                    guard let strongSelf = self else {
                        return
                    }
                    
                    strongSelf.buttonClicked = false
                    strongSelf.circularProgress.timeToFill = 0
                    strongSelf.circularProgress.progress = 0
                }
            case .failure(let error):
                print("An error has ocurred while fetching data: \(error)")
                DispatchQueue.main.async {
                    strongSelf.buttonClicked = false
                    strongSelf.circularProgress.timeToFill = 0
                    strongSelf.circularProgress.progress = 0
                }
            }
        })
    }
}
