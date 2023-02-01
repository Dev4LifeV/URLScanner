//
//  CircularProgressView.swift
//  URLScanner
//
//  Created by Victor Proppe on 28/01/23.
//

import UIKit

class CircularProgressView: UIView {
    
    
    /// Progress layer to be drawn
    private var progressLayer = CAShapeLayer()
    
    /// Track layer (what need to be completed) to be drawn
    private var trackLayer = CAShapeLayer()
    
    /// Whether progress layer is rounded
    private var rounded: Bool
    
    /// Whether progress layer is filled
    private var filled: Bool

    /// Thickness of line stroke
    private let lineWidth: CGFloat?
    
    /// Time to animation be completed
    var timeToFill = 3.43
    
    /// Progress color (what was already completed)
    var progressColor = UIColor.white {
        didSet{
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    
    /// Track color (what needs to be completed)
    var trackColor = UIColor.white {
        didSet{
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    
    /// Current progress
    var progress: Double {
        didSet{
            var pathMoved = oldValue - self.progress
            if pathMoved < 0{
                pathMoved = 0 - self.progress
            }
            
            setProgress(duration: timeToFill * pathMoved, to: self.progress)
            
        }
    }
    
    
    /// Set the layer's path, color and stroke width and style as well as adds the layer to the main layer's view.
    private func drawLayer(_ customLayer: CAShapeLayer, path: CGPath, color: CGColor, strokeEnd: CGFloat) {
        customLayer.path = path
        customLayer.fillColor = .none
        customLayer.strokeColor = color
        if filled {
            customLayer.lineCap = .butt
            customLayer.fillColor = color
            customLayer.lineWidth = frame.width
        } else {
            customLayer.lineWidth = lineWidth!
        }
        customLayer.strokeEnd = strokeEnd
        
        if rounded {
            customLayer.lineCap = .round
        }
        
        layer.addSublayer(customLayer)
    }
    
    
    /// Create the whole progress view setting the radius, background color, corner radius and then draws the both layers (progress and track layers).
    private func createProgressView(){
        let radius = frame.size.width / 2
        
        self.backgroundColor = .clear
        
        self.layer.cornerRadius = radius
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(radius), clockwise: true)
        
        drawLayer(trackLayer, path: circularPath.cgPath, color: UIColor.systemGray.cgColor, strokeEnd: 0.5)
        
        drawLayer(progressLayer, path: circularPath.cgPath, color: UIColor.blue.cgColor, strokeEnd: 0)
        
    }
    
    /// Creates the animation for the progress
    private func setProgress(duration: TimeInterval = 3, to newProgress: Double) -> Void{
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = newProgress
        
        progressLayer.strokeEnd = CGFloat(newProgress)
        
        progressLayer.add(animation, forKey: "animationProgress")
        
    }
    
    required init?(coder: NSCoder) {
        progress = 0
        rounded = true
        filled = false
        lineWidth = 15
        super.init(coder: coder)
        createProgressView()
    }
    
    
    init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {
        progress = 0
        
        if lineWidth == nil {
            self.filled = true
            self.rounded = false
        } else {
            if rounded {
                self.rounded = true
            } else {
                self.rounded = false
            }
            self.filled = false
        }
        
        self.lineWidth = lineWidth
        super.init(frame: frame)
        createProgressView()
    }
}
