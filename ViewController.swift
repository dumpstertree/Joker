//
//  ViewController.swift
//  Joker
//
//  Created by Zachary Collins on 10/10/17.
//  Copyright © 2017 dumpstertree. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LineDrawingDataSource {
    
    @IBOutlet weak var _lineDrawingView: LineDrawing!
    @IBOutlet weak var ChatTableView: UITableView!
    
    private var _messageLog: [Message] = []
    private let _contacts = Contacts()
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
    
        createChatLog()
        
        _lineDrawingView.Delegate = self
        
        ChatTableView.delegate = self
        ChatTableView.dataSource = self
        
        ChatTableView.rowHeight = UITableViewAutomaticDimension
        ChatTableView.estimatedRowHeight = 100
    }

    
    // TABLE VIEW DATA
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _messageLog.count
    }
    
  
    // TABLE VIEW DELEGATE
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        _lineDrawingView.Reload()
        let cell: MessageCell = ChatTableView.dequeueReusableCell(withIdentifier: "OtherCell") as! MessageCell
        cell.SetContents( message: _messageLog[indexPath.row], index: indexPath.row, contactList: _contacts )
        return cell
    }
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        _lineDrawingView.Reload()
    }
    
    
    // LINE DRAWING DATA
    internal func activeCells() -> [UITableViewCell]{
        return ChatTableView.visibleCells
    }
    
    
    // PRIVATE
    private func createChatLog(){
        _messageLog.append( Message(userID: "1", contents: "hello" ) )
        _messageLog.append( Message(userID: "2", contents: "Lorem ipsum dolor sit amet, ac aenean at facilisis amet ipsum vel, ullamcorper quis" ) )
        _messageLog.append( Message(userID: "2", contents: "Lorem ipsum" ) )
        _messageLog.append( Message(userID: "3", contents: "Lorem ipsum dolor ulla" ) )
        _messageLog.append( Message(userID: "1", contents: "Lorem ipsum dolor sit amet") )
        _messageLog.append( Message(userID: "1", contents: "Lorem ipsum dolor sit amet, ac aenean at facilisis amet ipsum vel, ullamcorper quis" ) )
        _messageLog.append( Message(userID: "2", contents: "Lorem ipsum dolor sit amet, ac aenean at facilisis amet ipsum vel, ullamcorper quis" ) )
        _messageLog.append( Message(userID: "3", contents: "ac aenean at facilisis amet ipsum vel, ullamcorper quis" ) )
        _messageLog.append( Message(userID: "2", contents: "Lorem ipsum dolor sit amet, ac aenean at facilisis amet ipsum vel, ullamcorper quis" ) )
    }
}

