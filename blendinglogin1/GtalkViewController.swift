//
//  GtalkViewController.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/01.
//

import UIKit

class GtalkViewController: UIViewController{
    
    private let cellId = "cellId"
    
    @IBOutlet weak var chatListTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = .purple
        navigationItem.title = "トーク"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension GtalkViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatListTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    
}


class ChatListTableViewCell: UITableViewCell{
    
    @IBOutlet weak var partnerLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var latestMessageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }
    
}
