//
//  LineDrawingTableView.swift
//  Joker
//
//  Created by Zachary Collins on 10/15/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import UIKit

class LineDrawingTableView: UITableView, UITableViewDelegate {
    
    let SHADOW_OFFSET_X: CGFloat = 20
    let SHADOW_OFFSET_Y: CGFloat = -20
    
    
    // init
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
   
    // delegate
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
         self.setNeedsDisplay()
    }

    
    
    // override
    override func draw(_ rect: CGRect) {

        super.draw(rect)
        
        guard let cells = self.visibleCells as? [MessageCell] else {
            return
        }
        
        
        let sortedCells = cells.sorted { $0.Index < $1.Index }
        
        var shadowLinePoints: [LinePoint] = []
        var linePoints: [LinePoint] = []
        
        sortedCells.forEach{ cell in
            
            let center = convert( cell.lineCenter(), to: self )
            let width: CGFloat = cell._message!.LineWidth!
            
            let p1 = CGPoint( x: center.x-width/2, y: center.y)
            let p2 = CGPoint( x: center.x+width/2, y: center.y)
            
            linePoints.append( LinePoint( p1: p1, p2: p2 ) )
            
            let sp1 = convert( CGPoint( x: center.x-width/2 + SHADOW_OFFSET_X, y: center.y + SHADOW_OFFSET_Y), to: self)
            let sp2 = convert( CGPoint( x: center.x+width/2 + SHADOW_OFFSET_X, y: center.y + SHADOW_OFFSET_Y), to: self)
            
            shadowLinePoints.append( LinePoint( p1: sp1, p2: sp2 ) )
        }
        
        var lineArray: [CGPoint] = []
        var shadowLineArray: [CGPoint] = []
        
        for i in 0..<linePoints.count{
            lineArray.append(linePoints[i].Point1)
            shadowLineArray.append(shadowLinePoints[i].Point1)
        }
        for i in (0..<linePoints.count).reversed(){
            lineArray.append(linePoints[i].Point2)
            shadowLineArray.append(shadowLinePoints[i].Point2)
        }
        
        // profile pic
        DrawingUtility.Draw(points: shadowLineArray, color: UIColor(colorLiteralRed: 110.0/255.0, green: 0.0, blue: 10.0/255.0, alpha: 1) )
        DrawingUtility.Draw(points: lineArray, color: UIColor.black)
    }
}
