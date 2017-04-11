//
//  NFFlatButton.swift
//  NFFlatButtonSample
//
//  Copyright (c) 2014 norfred. All rights reserved.
//

import UIKit
import QuartzCore

class NFFlatButton: UIButton {
    
    fileprivate var shapeLayer: CAShapeLayer = CAShapeLayer()
    fileprivate var fillLayer: CAShapeLayer = CAShapeLayer()
    
    fileprivate var strokeColor: UIColor = UIColor()
    fileprivate var fillColor: UIColor = UIColor()
   
    var lineWidth: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.strokeColor = self.titleColor(for: UIControlState())!
        self.fillColor = self.titleColor(for: UIControlState())!
        
        self.lineWidth = 2.0
        
        setupShapeLayer()
    }
    
    fileprivate func setupShapeLayer() {
        
        shapeLayer.bounds = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        shapeLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        var outlinePath: UIBezierPath
        
        // FIXME: Better way to draw a smooth circle
        if self.frame.size.width == self.frame.size.height {
            outlinePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        } else {
            outlinePath = UIBezierPath(roundedRect: self.bounds.insetBy(dx: self.lineWidth, dy: self.lineWidth), cornerRadius: self.bounds.size.height/2)
        }
        
        shapeLayer.path = outlinePath.cgPath
        shapeLayer.strokeColor = self.strokeColor.cgColor
        shapeLayer.fillColor = nil
        shapeLayer.shadowColor = nil
        shapeLayer.lineWidth = self.lineWidth
        
        self.layer.insertSublayer(shapeLayer, below: titleLabel?.layer)
    }
    
    fileprivate func setupFillLayer() {
        
        fillLayer.bounds = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        fillLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        
        var fillPath: UIBezierPath
        fillPath = UIBezierPath(roundedRect: self.bounds.insetBy(dx: self.lineWidth * 3, dy: self.lineWidth * 3), cornerRadius: self.bounds.size.height/2)
        
        fillLayer.path = fillPath.cgPath
        fillLayer.fillColor = self.fillColor.cgColor
        fillLayer.shadowColor = nil
        
        shapeLayer.addSublayer(fillLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
        self.setNeedsDisplay()
    }
    
    override var isHighlighted: Bool {
        
        get {
            return super.isHighlighted
        }
        
        set(isHighlighted) {
            if (isHighlighted) {
                self.titleLabel?.textColor = UIColor.white
                setupFillLayer()
            }
            else {
                fillLayer.removeFromSuperlayer()
                self.titleLabel?.textColor = self.strokeColor
            }
            
        }
    }
}
