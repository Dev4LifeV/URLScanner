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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let mockData =
        ScanResponse(message: "", success: true, unsafe: true, domain: "domain", ipAddress: "", server: "", contentType: "", statusCode: 0, pageSize: 0, domainRank: 0, dnsValid: true, parking: true, spamming: true, malware: true, phishing: true, suspicious: true, adult: true, riskScore: 0, domainAge: DomainAge(human: "", timeStamp: 0, iso: ""), category: "", requestId: "")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScanDetailsCell

        cell.scanDetail = mockData
        
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
    
    var scanDetail: ScanResponse? {
        didSet {
            
            detail.text = self.scanDetail?.domain ?? "AAA"
            detail.textColor = .black
            
            status.text = String(self.scanDetail?.statusCode ?? 0)
            detail.textColor = .black
        }
    }
    
    let detail = UILabel()
    let status = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let info = UIView(frame: CGRect(x: 0, y: 0, width: frame.width - 30, height: 0))
        
        detail.enableAutoLayout()
        status.enableAutoLayout()
        info.enableAutoLayout()
        
        info.addSubview(status)
        info.addSubview(detail)
        
        [
            status.left.constraint(equalTo: detail.right, constant: info.frame.width)
        ].activate()
        
        contentView.addSubview(info)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
