//
//  NFFlatButton.swift
//  NFFlatButtonSample
//
//  Copyright (c) 2014 norfred. All rights reserved.
//

import UIKit
import QuartzCore

class NFFlatButton: UIButton {
    
    private var shapeLayer: CAShapeLayer = CAShapeLayer()
    private var fillLayer: CAShapeLayer = CAShapeLayer()
    
    private var strokeColor: UIColor = UIColor()
    private var fillColor: UIColor = UIColor()
   
    var lineWidth: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.strokeColor = self.titleColorForState(.Normal)!
        self.fillColor = self.titleColorForState(.Normal)!
        
        self.lineWidth = 2.0
        
        setupShapeLayer()
    }
    
    private func setupShapeLayer() {
        
        shapeLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        shapeLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        
        var outlinePath: UIBezierPath
        
        // FIXME: Better way to draw a smooth circle
        if self.frame.size.width == self.frame.size.height {
            outlinePath = UIBezierPath(ovalInRect: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)))
        } else {
            outlinePath = UIBezierPath(roundedRect: CGRectInset(self.bounds, self.lineWidth, self.lineWidth), cornerRadius: self.bounds.size.height/2)
        }
        
        shapeLayer.path = outlinePath.CGPath
        shapeLayer.strokeColor = self.strokeColor.CGColor
        shapeLayer.fillColor = nil
        shapeLayer.shadowColor = nil
        shapeLayer.lineWidth = self.lineWidth
        
        self.layer.insertSublayer(shapeLayer, below: titleLabel?.layer)
    }
    
    private func setupFillLayer() {
        
        fillLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)
        fillLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds))
        
        var fillPath: UIBezierPath
        fillPath = UIBezierPath(roundedRect: CGRectInset(self.bounds, self.lineWidth * 3, self.lineWidth * 3), cornerRadius: self.bounds.size.height/2)
        
        fillLayer.path = fillPath.CGPath
        fillLayer.fillColor = self.fillColor.CGColor
        fillLayer.shadowColor = nil
        
        shapeLayer.addSublayer(fillLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
        self.setNeedsDisplay()
    }
    
    override var highlighted: Bool {
        
        get {
            return super.highlighted
        }
        
        set(isHighlighted) {
            if (isHighlighted) {
                self.titleLabel?.textColor = UIColor.whiteColor()
                setupFillLayer()
            }
            else {
                fillLayer.removeFromSuperlayer()
                self.titleLabel?.textColor = self.strokeColor
            }
            
        }
    }
}
