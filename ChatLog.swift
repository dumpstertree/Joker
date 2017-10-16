//
//  ChatLog.swift
//  Joker
//
//  Created by Zachary Collins on 10/14/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import UIKit

class ChatLog{
    
}

class Message{
    
    public let UserID: String?
    public let Contents: String?
    public let LineWidth: CGFloat?
    public let Offset: CGFloat?
    
    init( userID: String, contents: String ) {
        UserID = userID
        Contents = contents
        LineWidth = CGFloat(UInt32(25) + arc4random_uniform(10))
        Offset = CGFloat(arc4random_uniform(25))
    }
}
