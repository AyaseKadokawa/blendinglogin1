//
//  ChatInputAccessoryView.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/08.
//

import UIKit

protocol ChatInputAccessoryViewDelegate: class {
    func tappedSendButton(text: String)
}

class ChatInputAccessoryView: UIView {
    

    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func tappedSendButton(_ sender: Any) {
        guard let text = chatTextView.text else { return }
        delegate?.tappedSendButton(text: text)
    }
    
    weak var delegate: ChatInputAccessoryViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        nibInit()
        setupViews()
        autoresizingMask = .flexibleHeight
    }
    
    private func setupViews() {
       // chatTextView.layer.cornerRadius = 10
       // chatTextView.layer.borderWidth = 1
        
        sendButton.layer.cornerRadius = 10
        sendButton.imageView?.contentMode = .scaleAspectFill
        sendButton.contentHorizontalAlignment = .fill
        sendButton.isEnabled = false
        
        chatTextView.text = ""
        chatTextView.delegate = self
    }
    
    func removeText(){
        chatTextView.text = ""
        sendButton.isEnabled = false
    }
    
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    private func nibInit(){
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


extension ChatInputAccessoryView: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
       // print("textView.text: ", textView.text)
        if textView.text.isEmpty {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
    }
}
