//
//  MyView.swift
//  DrawLine
//
//  Created by K.Yawn Xoan on 3/24/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

import UIKit

class MyView: UIView {
    
 
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        var context = UIGraphicsGetCurrentContext()
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 200, 200)
//        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context, 100, 300)
        CGContextAddLineToPoint(context, 100, 400)
        CGContextAddLineToPoint(context, 200, 500)
        CGContextSetRGBStrokeColor(context, 1, 0, 1, 1)
//        CGContextSetLineWidth(context, 1)
        CGContextStrokePath(context)
    }


}
