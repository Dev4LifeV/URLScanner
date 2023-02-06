//
//  Size.swift
//  URLScanner
//
//  Created by Victor Proppe on 26/01/23.
//

import UIKit

extension Array where Element: NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate(self)
    }
}

extension UIView {
    
    func enableAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = !translatesAutoresizingMaskIntoConstraints
    }
    
    var top: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }
    
    var bottom: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    
    var right: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.trailingAnchor
    }
    
    var left: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leadingAnchor
    }
    
    var centerX: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.centerXAnchor
    }
    
    var centerY: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.centerYAnchor
    }
    
    var width: NSLayoutDimension {
        return safeAreaLayoutGuide.widthAnchor
    }
    
    var height: NSLayoutDimension {
        return safeAreaLayoutGuide.heightAnchor
    }
}
