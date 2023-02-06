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
    
    var scanDetails: ScanResponse? {
        didSet {
            self.scanDetailsFormatted = scanDetails?.asDictionary
        }
    }
    
    var scanDetailsFormatted: [String: Any]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scanDetails != nil ? Mirror(reflecting: scanDetails!).children.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScanDetailsCell
        
        guard let scan = scanDetailsFormatted else {
            return cell
        }

        cell.key = "\(Array(scan.keys)[indexPath.row].formatModelKey()): "
        cell.value = "\(Array(scan.values)[indexPath.row])"
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
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
        contentView.addSubview(keyLabel)
        contentView.addSubview(valueLabel)
        keyLabel.enableAutoLayout()
        keyLabel.height.constraint(equalToConstant: 40).isActive = true
        keyLabel.left.constraint(equalTo: self.left, constant: 20).isActive = true
        valueLabel.enableAutoLayout()
        valueLabel.height.constraint(equalToConstant: 40).isActive = true
        valueLabel.left.constraint(equalTo: keyLabel.right).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let keyLabel = UILabel()
    
    var key: String = "" {
        didSet {
            keyLabel.text = self.key
        }
    }
    
    private let valueLabel = UILabel()
    
    var value: String = "" {
        didSet {
            valueLabel.text = self.value
        }
        
    }
    
}
