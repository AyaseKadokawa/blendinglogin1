//
//  ProfileViewController.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/01.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    var messageText: String? {
        didSet{
            guard let text = messageText else { return }
            let width = estimateFrameForTextView(text: text).width + 40
            
            messageTextViewWidthConstraint.constant = width
            messageTextView.text = text
        }
    }
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func estimateFrameForTextView(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
}
