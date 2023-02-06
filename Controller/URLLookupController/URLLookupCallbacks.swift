//
//  URLLookupCallbacks.swift
//  URLScanner
//
//  Created by Victor Proppe on 01/02/23.
//

import Foundation
import UIKit

extension URLLookupViewController {
    
    @objc func updateProgress(_ notification: Notification) {
        guard let progress = notification.userInfo?["progress"] as? Double else {
            return
        }
        
        DispatchQueue.main.async {
            self.circularProgress.progress = progress
        }
    }
    
    @objc func scanURL() {
        
        guard let url = urlField.text else {
            return
        }
        
        guard !url.trim().isEmpty else {
            DispatchQueue.main.async { [weak self] in
                
                guard let strongSelf = self else {
                    return
                }
                
                let alert = UIAlertController(title: "Inconsistence", message: "Please, type a valid URL address", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                    strongSelf.tabBarController?.tabBar.isHidden = false
                    alert.dismiss(animated: true)
                })
                
                alert.addAction(action)
                
                strongSelf.present(alert, animated: true)
            }
            return
        }
        
        DispatchQueue.main.async {
            self.buttonClicked = true
        }
        
        self.circularProgress.timeToFill = 2
        
        usecaseGetURLScan.callUsecase(with: { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let scan):
                
                DispatchQueue.main.asyncAfter(deadline: .now() + strongSelf.circularProgress.timeToFill) { [weak self] in
                    
                    guard let strongSelf = self else {
                        return
                    }
                    
                    strongSelf.buttonClicked = false
                    strongSelf.circularProgress.timeToFill = 0
                    strongSelf.circularProgress.progress = 0
                }
                
                DispatchQueue.main.async { [weak self] in
                    
                    guard let strongSelf = self else {
                        return
                    }
                    
                    guard let tabBar = strongSelf.tabBarController else {
                        return
                    }
                    
                    guard let vcs = tabBar.viewControllers else {
                        return
                    }
                    
                    let navVC = vcs[1]
                    
                    let vc = navVC.children[0] as! URLLookupDetailsViewController
                    
                    vc.scan = scan
                    tabBar.selectedIndex = 1
                    strongSelf.tabBarController?.tabBar.isHidden = false
                }
                
            case .failure(let error):
                print("An error has ocurred while fetching data: \(error)")
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "An error has ocurred. Please, check the URL address you have typed and try again.", preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "Ok", style: .default, handler: {_ in
                        strongSelf.tabBarController?.tabBar.isHidden = false
                        alert.dismiss(animated: true)
                    })
                    
                    alert.addAction(action)
                    
                    strongSelf.buttonClicked = false
                    strongSelf.circularProgress.timeToFill = 0
                    strongSelf.circularProgress.progress = 0
                    strongSelf.present(alert, animated: true)
                }
            }
        }, params: url)
        
        DispatchQueue.main.async {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
}
