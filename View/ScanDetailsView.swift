//
//  ScanDetailsView.swift
//  URLScanner
//
//  Created by Victor Proppe on 01/02/23.
//

import UIKit

class ScanDetailsView: UITableView, UITableViewDelegate, UITableViewDataSource {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
        self.register(ScanDetailsCell.self, forCellReuseIdentifier: "cell")
        self.backgroundColor = .gray
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mockData =
        ScanResponse(message: "", success: true, unsafe: true, domain: "domain", ipAddress: "", server: "", contentType: "", statusCode: 0, pageSize: 0, domainRank: 0, dnsValid: true, parking: true, spamming: true, malware: true, phishing: true, suspicious: true, adult: true, riskScore: 0, category: "", requestId: "")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Mirror(reflecting: mockData).children.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScanDetailsCell

        cell.key = "\(Array(mockData.asDictionary.keys)[indexPath.row]): ".capitalized
        cell.value = "\(Array(mockData.asDictionary.values)[indexPath.row])"
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

internal class ScanDetailsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.keyLabel.textColor = .white
        self.valueLabel.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let keyLabel = UILabel()
    
    var key: String = "" {
        didSet {
            keyLabel.text = self.key
            keyLabel.enableAutoLayout()
            contentView.addSubview(keyLabel)
            keyLabel.height.constraint(equalToConstant: 40).isActive = true
            keyLabel.left.constraint(equalTo: self.left, constant: 20).isActive = true
        }
    }
    
    private let valueLabel = UILabel()
    
    var value: String = "" {
        didSet {
            valueLabel.enableAutoLayout()
            valueLabel.text = self.value
            valueLabel.height.constraint(equalToConstant: 40).isActive = true
            contentView.addSubview(valueLabel)
            valueLabel.left.constraint(equalTo: keyLabel.right).isActive = true
        }
        
    }
    
}
