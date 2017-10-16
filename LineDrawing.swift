//
//  LineDrawing.swift
//  Joker
//
//  Created by Zachary Collins on 10/14/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import  UIKit

class LineDrawing: UIView {
    
    let SHADOW_OFFSET_X: CGFloat = 20
    let SHADOW_OFFSET_Y: CGFloat = -20
    
    var Delegate: LineDrawingDataSource?
    
    public func Reload(){
         self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {

        guard let d = Delegate else {
            return
        }
        
        guard let cells = d.activeCells() as? [MessageCell] else {
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
            
            let sp1 = CGPoint( x: center.x-width/2 + SHADOW_OFFSET_X, y: center.y + SHADOW_OFFSET_Y)
            let sp2 = CGPoint( x: center.x+width/2 + SHADOW_OFFSET_X, y: center.y + SHADOW_OFFSET_Y)
            
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
struct LinePoint {
    
    public let Point1: CGPoint
    public let Point2: CGPoint
    
    init( p1: CGPoint, p2: CGPoint ) {
        Point1 = p1
        Point2 = p2
    }
}
protocol LineDrawingDataSource {
    func activeCells() -> [UITableViewCell]
}
protocol LineCellDataSource {
    func lineCenter() -> CGPoint
}
