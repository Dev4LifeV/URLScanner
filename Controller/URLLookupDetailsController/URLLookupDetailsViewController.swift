//
//  URLSearchDetailsViewController.swift
//  URLScanner
//
//  Created by Victor Proppe on 27/01/23.
//

import UIKit

class URLLookupDetailsViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isHidden = true
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    let rowHeight = 40.0
    var numOfRows: CGFloat = 0
    
    let header: CardView = {
        let cardView = CardView()
        cardView.enableAutoLayout()
        return cardView
    }()
    
    let divider: UIView = {
        let divider = UIView()
        divider.enableAutoLayout()
        divider.backgroundColor = .white
        return divider
    }()
    
    let urlLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let suspiciousLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let scanDetails: ScanDetailsView = {
        let table: ScanDetailsView = ScanDetailsView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        table.enableAutoLayout()
        return table
    }()
    
    let noDataAvailableLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.enableAutoLayout()
        label.text = "No data available. Start your first scan."
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    var scan: ScanResponse? {
        didSet {
            guard let scan = self.scan else {
                noDataAvailableLabel.isHidden = false
                numOfRows = 1
                scrollView.isHidden = true
                header.isHidden = true
                contentView.isHidden = true
                return
            }
            
            numOfRows = CGFloat(Mirror(reflecting: scan).children.count)
            
            scanDetails.scanDetails = scan
            urlLabel.text = scan.domain
            
            suspiciousLabel.text = scan.suspicious ? "This domain may harm your device." : "This domain is not dangerous."
            suspiciousLabel.textColor = scan.suspicious ? .red : .green

            scanDetails.reloadData()
            
            noDataAvailableLabel.isHidden = true
            scrollView.isHidden = false
            header.isHidden = false
            contentView.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        header.addSubview(urlLabel)
        header.addSubview(divider)
        header.addSubview(suspiciousLabel)
        contentView.addSubview(header)
        contentView.addSubview(scanDetails)
        view.addSubview(noDataAvailableLabel)
        
        setupScrollView()
        setupContentView()
        setConstraintsNoDataLabel()
        setConstraintsHeader()
        setConstraintsScanDetails()
        setConstraintsUrlHeader()
    }


}
