//
//  URLSearchDetailsViewController.swift
//  URLScanner
//
//  Created by Victor Proppe on 27/01/23.
//

import UIKit

class URLLookupDetailsViewController: UIViewController {
    
    let header: CardView = {
        let cardView = CardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(header)

        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 100),
            header.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            header.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            header.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }


}
