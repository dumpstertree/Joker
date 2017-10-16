//
//  MessageCell.swift
//  Joker
//
//  Created by Zachary Collins on 10/10/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import UIKit

class MessageCell: UITableViewCell, LineCellDataSource {
    
    
    // LABEL
    @IBOutlet weak var MessageContentsLabel: UILabel!
    
    
    // CONSTRAINT
    @IBOutlet weak var _profilePicImageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var _speechBubbleLeadinfConstraint: NSLayoutConstraint!
    @IBOutlet weak var _messageContentsLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var _profilePicLeadingConstraint: NSLayoutConstraint!
    
    
    // VIEW
    @IBOutlet weak var _profilePictureImageView: UIImageView!
    @IBOutlet weak var _messageContentsView: UIView!
    @IBOutlet weak var _profilePicView: UIView!
    @IBOutlet weak var _speechBubbleView: UIView!
    
   
    // CONSTANTS
    private let RAD_TO_DEGREE: CGFloat = 0.0174533
    private let TEXT_ROTATION: CGFloat = -8.0
    
    
    // PUBLIC PROPS
    public var Index: Int = -1
    public var _message: Message?
    
    
    // PRIVATE
    private var _contact: Contact?
    
    
    
    // PUBLIC
    public func SetContents( message: Message, index: Int, contactList: Contacts ) {
        
        _message = message
        Index = index
        MessageContentsLabel.transform = CGAffineTransform(rotationAngle: RAD_TO_DEGREE * TEXT_ROTATION )
        
        // set contents
        if let contents = _message?.Contents{
            MessageContentsLabel.text = contents
        }
        
        // set offset
        if let offset = _message?.Offset {
           // _profilePicLeadingConstraint.constant = 10 + offset
            //_profilePicImageLeadingConstraint.constant = 10 + offset
            //_messageContentsLeadingConstraint.constant = 95 + offset
            //_speechBubbleLeadinfConstraint.constant = 85 + offset
            self.layoutIfNeeded()
        }
        
        // set contact
        if let userID =  _message?.UserID {
            _contact = contactList.GetContact( forID: userID )
            
        }
        
        if let profilePic = _contact?.Image {
            _profilePictureImageView.image = profilePic
        }
        
        
    }
    
   
    // LINE CELL DATA SOURCE
    public func lineCenter() -> CGPoint{
        
        // zig/down
        if ( Index%2 == 0){
            let ws = convert( _profilePicView.frame.origin , to: nil)
            let newPos = CGPoint( x: ws.x + 20 , y: ws.y + 60)
            return newPos
        }
        // zag/right
        else{
            let ws = convert( _profilePicView.frame.origin , to: nil)
            let newPos = CGPoint( x: ws.x + 80, y: ws.y)
            return newPos
        }
    }



    // DRAW
    override func draw(_ rect: CGRect) {
        drawProfilePicture()
        drawMessage()
        maskProfileImage()
    }
    private func drawProfilePicture(){
         DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _profilePicView, x: 0,    y: 3,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _profilePicView, x: -10,  y: 0,  fromPosition: .TOPRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: 0,    y: -25,  fromPosition: .BOTTOMRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: 20,   y: 0,  fromPosition: .BOTTOMLEFT), ],
            color: UIColor.black)
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _profilePicView, x: 6,    y: 8,   fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _profilePicView, x: -12,  y: 5,   fromPosition: .TOPRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: -2,   y: -30, fromPosition: .BOTTOMRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: 25,   y: -8,   fromPosition: .BOTTOMLEFT), ],
            color: UIColor.white)
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _profilePicView, x: 12,   y: 13,   fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _profilePicView, x: -14,  y: 8,   fromPosition: .TOPRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: -4,   y: -32, fromPosition: .BOTTOMRIGHT),
            DrawingUtility.GetPoint( view: _profilePicView, x: 30,   y: -12,   fromPosition: .BOTTOMLEFT), ],
            color: _contact!.Color )
    }
    private func drawMessage(){
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _messageContentsView, x: 10,   y: 40,   fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: 0,    y: 0,    fromPosition: .TOPRIGHT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: -20,  y: -20,  fromPosition: .BOTTOMRIGHT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: 0,    y: 0,    fromPosition: .BOTTOMLEFT), ],
            color: UIColor.white)
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 0,   y: 20,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 16,  y: 0,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 24,  y: 6,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 32,  y: 0,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 32,  y: 25,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 16,  y: 32,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 10,  y: 20,  fromPosition: .TOPLEFT)],
            color: UIColor.white)
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _messageContentsView, x: 14,   y: 46,   fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: -15,  y: 6,    fromPosition: .TOPRIGHT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: -26,  y: -26,  fromPosition: .BOTTOMRIGHT),
            DrawingUtility.GetPoint( view: _messageContentsView, x: 6,    y: -6,   fromPosition: .BOTTOMLEFT), ],
            color: UIColor.black)
        DrawingUtility.Draw(points: [
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 2,   y: 20,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 18,  y: 2,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 20,  y: 10,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 32,  y: 2,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 32,  y: 20,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 18,  y: 26,  fromPosition: .TOPLEFT),
            DrawingUtility.GetPoint( view: _speechBubbleView, x: 12,  y: 16,  fromPosition: .TOPLEFT)],
            color: UIColor.black)
    }
    private func maskProfileImage(){
       
        let points = [ convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: 0,  y: 0,   fromPosition: .TOPLEFT),     to: _profilePictureImageView),
                       convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: 0,  y: -20, fromPosition: .TOPLEFT),     to: _profilePictureImageView),
                       convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: 0,  y: -20, fromPosition: .TOPRIGHT),    to: _profilePictureImageView),
                       convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: 0,  y: 0,   fromPosition: .TOPRIGHT),    to: _profilePictureImageView),
                       convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: -4, y: -32, fromPosition: .BOTTOMRIGHT), to: _profilePictureImageView),
                       convert( DrawingUtility.GetPoint( view: _profilePictureImageView, x: 30, y: -12, fromPosition: .BOTTOMLEFT),  to: _profilePictureImageView)]
        
        let path = UIBezierPath()
        
        path.move(to: points[0])
        for i in 1..<points.count {
            path.addLine(to: points[i])
        }
        path.close()
        
        let maskForYourPath = CAShapeLayer()
        maskForYourPath.path = path.cgPath
        _profilePictureImageView.layer.mask = maskForYourPath
    }
}
