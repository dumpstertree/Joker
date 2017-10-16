//
//  DrawingUtility.swift
//  Joker
//
//  Created by Zachary Collins on 10/14/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import UIKit

class DrawingUtility{

    static func GetPoint( view: UIView, x: CGFloat, y: CGFloat, fromPosition: FromPosition ) -> CGPoint{
        
        let origin = view.frame.origin;
        let size = view.frame.size;
        let startPos: CGPoint?
        
        switch fromPosition {
        case .TOPLEFT:
            startPos = CGPoint(x: origin.x, y: origin.y)
        case .TOPRIGHT:
            startPos = CGPoint(x: origin.x+size.width, y: origin.y)
        case .BOTTOMLEFT:
            startPos = CGPoint(x: origin.x, y: origin.y+size.height)
        case .BOTTOMRIGHT:
            startPos = CGPoint(x: origin.x+size.width, y: origin.y+size.height)
        }
        
        return CGPoint(x: startPos!.x + x , y: startPos!.y + y)
    }
    
    static func Draw( points: [CGPoint], color: UIColor ){
        
        let path = UIBezierPath()
        
        path.move(to: points[0])
        
        for i in 1..<points.count {
            path.addLine(to: points[i])
        }
        
        path.close()
        color.set()
        path.fill()
    }
    
    public enum FromPosition{
        case TOPLEFT
        case TOPRIGHT
        case BOTTOMLEFT
        case BOTTOMRIGHT
    }
}
