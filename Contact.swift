//
//  Contact.swift
//  Joker
//
//  Created by Zachary Collins on 10/11/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import Foundation
import UIKit

class Contacts{
    
    private var _contacts: [String:Contact] = [:]
    
    public func GetContact( forID: String ) -> Contact {
        
        guard let v = _contacts[forID] else {
            return Contact()
        }
            
        return v
    }
    public func AddContact( contact: Contact ){
       
        guard ( !_contacts.keys.contains(contact.ID)) else {
            return
        }
        
        _contacts[contact.ID] = contact
    }
    
    init() {
        AddContact( contact: Contact(ID: "1", Name: "Makoto", Color: UIColor.cyan,   image: #imageLiteral(resourceName: "Makato.png") ) )
        AddContact( contact: Contact(ID: "2", Name: "Ann",    Color: UIColor.purple, image: #imageLiteral(resourceName: "Ann.png") ) )
        AddContact( contact: Contact(ID: "3", Name: "Ryuji",  Color: UIColor.yellow, image: #imageLiteral(resourceName: "Ryuji.png") ) )
    }
}

public class Contact{
    
    public var ID : String
    public var Name : String
    public var Image : UIImage?
    public var Color : UIColor
    
    
    init() {
        self.ID = "NIL"
        self.Name = "NIL NIL"
        self.Color = UIColor.black
    }
    
    init( ID: String, Name: String, Color: UIColor, image: UIImage ) {
        self.ID = ID
        self.Name = Name
        self.Color = Color
        self.Image = image
    }
    
}
