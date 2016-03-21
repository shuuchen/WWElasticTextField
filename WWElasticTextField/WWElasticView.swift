//
//  WWElasticView.swift
//  WWElasticView
//
//  Created by Shuchen Du on 2016/03/18.
//  Copyright © 2016年 Shuchen Du. All rights reserved.
//

import UIKit

class WWElasticView: UIView {

    private let topControlPointView = UIView()
    private let bottomControlPointView = UIView()
    private let leftControlPointView = UIView()
    private let rightControlPointView = UIView()
    
    private let elasticShape = CAShapeLayer()
    
    @IBInspectable var overshootAmount: CGFloat = 10.0
    
    private lazy var displayLink: CADisplayLink = {
    
        let displayLink = CADisplayLink(target: self, selector: Selector("updateLoop"))
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        
        return displayLink
    }()
    
    override var backgroundColor: UIColor? {
        
        willSet {
            
            if let newValue = newValue {
                
                elasticShape.fillColor = newValue.CGColor
                super.backgroundColor = UIColor.clearColor()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupComponents()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        setupComponents()
    }
    
    private func positionControlPoints() {
        
        topControlPointView.center = CGPoint(x: bounds.midX, y: 0)
        bottomControlPointView.center = CGPoint(x: bounds.midX, y: bounds.maxY)
        leftControlPointView.center = CGPoint(x: 0, y: bounds.midY)
        rightControlPointView.center = CGPoint(x: bounds.maxX, y: bounds.midY)
    }
    
    private func setupComponents() {
    
        backgroundColor = UIColor.clearColor()
        clipsToBounds = false
        
        elasticShape.fillColor = backgroundColor?.CGColor
        elasticShape.path = UIBezierPath(rect: bounds).CGPath
        layer.addSublayer(elasticShape)
        
        // add control points
        for controlPoint in [topControlPointView, bottomControlPointView, leftControlPointView, rightControlPointView] {
            
            controlPoint.frame = CGRectMake(0, 0, 3, 3)
            addSubview(controlPoint)
        }
        positionControlPoints()
    }
    
    private func bezierPathForControlPoints() -> CGPathRef {
        
        let path = UIBezierPath()
        
        let top = topControlPointView.layer.presentationLayer()?.position
        let bottom = bottomControlPointView.layer.presentationLayer()?.position
        let left = leftControlPointView.layer.presentationLayer()?.position
        let right = rightControlPointView.layer.presentationLayer()?.position
        
        path.moveToPoint(bounds.origin)
        path.addQuadCurveToPoint(CGPoint(x: bounds.width, y: 0), controlPoint: top!)
        path.addQuadCurveToPoint(CGPoint(x: bounds.width, y: bounds.height), controlPoint: right!)
        path.addQuadCurveToPoint(CGPoint(x: 0, y: bounds.height), controlPoint: bottom!)
        path.addQuadCurveToPoint(bounds.origin, controlPoint: left!)
        
        return path.CGPath
    }
    
    func updateLoop() {
        
        elasticShape.path = bezierPathForControlPoints()
    }
    
    private func startUpdateLoop() {
        
        displayLink.paused = false
    }
    
    private func stopUpdateLoop() {
        
        displayLink.paused = true
    }
    
    private func animateControlPoints() {
        
        let overshootAmount = self.overshootAmount
        
        UIView.animateWithDuration(0.25, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1.5, options: [], animations: { [unowned self] in
            
            self.topControlPointView.center.y -= overshootAmount
            self.bottomControlPointView.center.y += overshootAmount
            self.leftControlPointView.center.x -= overshootAmount
            self.rightControlPointView.center.x += overshootAmount
            
            }, completion: { [unowned self] _ in
            
                UIView.animateWithDuration(0.45, delay: 0, usingSpringWithDamping: 0.15, initialSpringVelocity: 5.5, options: [], animations: { [unowned self] in
                    
                    self.positionControlPoints()
                    
                    }, completion: { [unowned self] _ in
                
                        self.stopUpdateLoop()
                })
            })
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        startUpdateLoop()
        animateControlPoints()
    }
}
