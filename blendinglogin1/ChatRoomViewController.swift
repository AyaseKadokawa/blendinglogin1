//
//  ChatRoomViewController.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/04.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet weak var chatRoomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chatRoomTableView.backgroundColor = .lightGray
    }
}
