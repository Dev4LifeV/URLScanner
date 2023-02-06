//
//  URLSearchDetailsViewController.swift
//  URLScanner
//
//  Created by Victor Proppe on 27/01/23.
//

import UIKit

class URLLookupDetailsViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    let contentView: UIView = UIView()
    
    let rowHeight = 40.0
    var numOfRows: CGFloat!
    
    let header: CardView = {
        let cardView = CardView()
        cardView.enableAutoLayout()
        return cardView
    }()
    
    let scanDetails: ScanDetailsView = {
        let table: ScanDetailsView = ScanDetailsView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        table.enableAutoLayout()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numOfRows = CGFloat(Mirror(reflecting: scanDetails.mockData).children.count)
    
        view.backgroundColor = .white
        
        contentView.addSubview(header)
        contentView.addSubview(scanDetails)
       
    }


}
