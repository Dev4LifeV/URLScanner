//
//  ViewController.swift
//  URLScanner
//
//  Created by Victor Proppe on 25/01/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlLookupViewController = URLLookupViewController()
        let urlLookupDetailsViewController = URLLookupDetailsViewController()
        
        urlLookupViewController.tabBarItem = UITabBarItem(title: "URL lookup", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        urlLookupDetailsViewController.tabBarItem = UITabBarItem(title: "Details", image: UIImage(systemName: "doc.text.magnifyingglass"), tag: 1)
        
        viewControllers = [UINavigationController(rootViewController: urlLookupViewController), UINavigationController(rootViewController: urlLookupDetailsViewController)]
        
    }
}

