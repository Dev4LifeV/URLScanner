//
//  CardView.swift
//  URLScanner
//
//  Created by Victor Proppe on 31/01/23.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if backgroundColor == nil {
            backgroundColor = .gray
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let title = UILabel(frame: CGRect(x: 10, y: 10, width: frame.width, height: 18))
//        title.text = "CardView"
//        title.font = .systemFont(ofSize: 18, weight: .bold)
//        
//        let content = UILabel(frame: CGRect(x: title.frame.origin.x, y: title.bottom + 10, width: frame.width, height: 20))
//        content.text = "This is a CardView"
        
        let path = UIBezierPath(rect: self.bounds)
        
        layer.cornerRadius = 10
        
        
        drawShadow(path: path.cgPath)
        cacheShadow(true)
        
//        self.addSubview(title)
//        self.addSubview(content)
    }
    
    func drawShadow(path: CGPath) {
        layer.shadowPath = path
        layer.shadowOffset = CGSize(width: 10, height: 15)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        
        if layer.shadowColor == nil {
            layer.shadowColor = UIColor.systemGray.cgColor
        }
    }
    
    func cacheShadow(_ caching: Bool) {
        layer.shouldRasterize = caching
        layer.rasterizationScale = UIScreen.main.scale
    }

}
