//
//  URLLookupDetailsDimensions.swift
//  URLScanner
//
//  Created by Victor Proppe on 03/02/23.
//

import Foundation
extension URLLookupDetailsViewController {
    override func viewDidLayoutSubviews() {
        setupScrollView()
        setupContentView()
        setConstraintsHeader()
        setConstraintsScanDetails()
    }
    
    func setupScrollView() {
        let scrollContentSizepadding = 200.0
        
        let scrollContentSize = CGSize(width: view.frame.width, height: rowHeight * numOfRows + scrollContentSizepadding)
        
        scrollView.enableAutoLayout()
        view.addSubview(scrollView)
        
        scrollView.contentSize = scrollContentSize
        [
            scrollView.right.constraint(equalTo: view.right),
            scrollView.left.constraint(equalTo: view.left),
            scrollView.top.constraint(equalTo: view.top),
            scrollView.bottom.constraint(equalTo: view.bottom)
        ].activate()
    }
    
    func setupContentView() {
        contentView.enableAutoLayout()
        scrollView.addSubview(contentView)
        
        
        [
            contentView.right.constraint(equalTo: scrollView.trailingAnchor),
            contentView.left.constraint(equalTo: scrollView.leadingAnchor),
            contentView.top.constraint(equalTo: scrollView.topAnchor),
        ].activate()

    }
    
    func setConstraintsHeader() {
        [
            header.height.constraint(equalToConstant: 100),
            header.width.constraint(equalTo: contentView.width, constant: -30),
            header.top.constraint(equalTo: contentView.top, constant: 20),
            header.bottom.constraint(equalTo: scanDetails.top, constant: -20),
            header.centerX.constraint(equalTo: contentView.centerX)
        ].activate()
    }
    
    func setConstraintsScanDetails() {
        [
            scanDetails.centerX.constraint(equalTo: contentView.centerX),
            scanDetails.width.constraint(equalTo: contentView.width, constant: -30),
            scanDetails.height.constraint(equalToConstant: rowHeight * numOfRows)
        ].activate()
    }
}
