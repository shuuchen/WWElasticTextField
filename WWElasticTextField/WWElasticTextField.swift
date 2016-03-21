//
//  WWElasticTextField.swift
//  WWElasticView
//
//  Created by Shuchen Du on 2016/03/20.
//  Copyright © 2016年 Shuchen Du. All rights reserved.
//

import UIKit

public class WWElasticTextField: UITextField {

    var elasticView: WWElasticView!
    
    @IBInspectable var overshootAmount: CGFloat = 10.0 {
        
        didSet {
            
            elasticView.overshootAmount = overshootAmount
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    public override func textRectForBounds(bounds: CGRect) -> CGRect {
        
        return CGRectInset(bounds, 10, 5)
    }
    
    public override func editingRectForBounds(bounds: CGRect) -> CGRect {

        return CGRectInset(bounds, 10, 5)
    }

    func setupView() {
        
        borderStyle = .None
        clipsToBounds = false
        
        elasticView = WWElasticView(frame: bounds)
        elasticView.backgroundColor = UIColor.whiteColor()
        elasticView.userInteractionEnabled = false
        addSubview(elasticView)
        
        backgroundColor = UIColor.clearColor()
    }
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        elasticView.touchesBegan(touches, withEvent: event)
    }
}
