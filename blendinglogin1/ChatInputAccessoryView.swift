//
//  ChatInputAccessoryView.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/08.
//

import UIKit

class ChatInputAccessoryView: UIView {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        nibInit()
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
