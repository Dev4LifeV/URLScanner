//
//  URLSearchViewController.swift
//  URLScanner
//
//  Created by Victor Proppe on 27/01/23.
//

import UIKit
class URLLookupViewController: UIViewController {
    
    let usecaseGetURLScan: UsecaseGetURLScan = UsecaseGetURLScan()
    
    let circularProgress:CircularProgressView = {
        let progress = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), lineWidth: 10, rounded: true)
        progress.isHidden = true
        progress.timeToFill = 6
        progress.progressColor = .systemBlue
        progress.trackColor = .gray
        progress.enableAutoLayout()
        return progress
    }()
    
    let insertURLLabel: UILabel = {
        let label = UILabel()
        label.text = "Scan for malwares in your URL address"
        label.textAlignment = .center
        label.font.withSize(18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.enableAutoLayout()
        return label
    }()
    
    let fetchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Scan URL", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        button.enableAutoLayout()
        return button
    }()
    
    let urlField: UITextField = {
        let input = UITextField()
        input.layer.borderWidth = 1.5
        input.layer.borderColor = UIColor.systemBlue.cgColor
        input.layer.cornerRadius = 10
        input.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        input.leftViewMode = .always
        input.keyboardType = .URL
        input.enableAutoLayout()
        return input
    }()
    
    static var response: ScanResponse?
    
    var buttonClicked: Bool! {
        didSet {
            self.fetchButton.isHidden = self.buttonClicked
            self.circularProgress.isHidden = !self.buttonClicked
            
            DispatchQueue.main.async {
                self.tabBarController?.tabBar.isHidden = self.buttonClicked
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        fetchButton.layer.cornerRadius = circularProgress.frame.width / 2
    
        fetchButton.addTarget(self, action: #selector(scanURL), for: .touchUpInside)
        
        view.addSubview(urlField)
        view.addSubview(fetchButton)
        view.addSubview(insertURLLabel)
        view.addSubview(circularProgress)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateProgress), name: NSNotification.Name("progress"), object: nil)
    }
}
