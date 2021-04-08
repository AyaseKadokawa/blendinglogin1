//
//  TimeLineTableViewCell.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/08.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var timelineImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLavel: UILabel!
    @IBOutlet weak var timelineTextField: UITextField!
  //  @IBOutlet weak var likeButton: UIButton!
  //  @IBOutlet weak var openRoomButton: UIButton!
  //  @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
