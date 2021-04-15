//
//  PostViewController.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/01.
//


import UIKit
import Firebase
import SVProgressHUD

protocol PostViewControllerDelegate: class {
    func tappedpostButton(text: String)
}

class PostViewController: UIViewController {

    
    @IBOutlet weak var postButton: UIBarButtonItem!
    @IBOutlet weak var webkensakuButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var postTextView: UITextView!
    
    //投稿ボタンを押して投稿した時のメソッド
    @IBAction func tappedpostButton(_ sender: Any) {
        
        //投稿データの保存場所を定義
        let postRef = Firestore.firestore().collection(Tweet.PostPath).document()
        
        //FireStoreに投稿データを保存
        let name = Auth.auth().currentUser?.displayName
        let postDic = [
            "name": name!,
            "postText": self.postTextView.text!
        ] as [String : Any]
        postRef.setData(postDic)
        
        //HUDで投稿完了を表示
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        //投稿処理が完了したのでHomeに戻る
        // rootViewControllerの1つ先のViewControllerに戻る
        dismiss(animated: true, completion: nil)
       }
    
    //画像を持ってくる
    @IBAction func tappedphotoButton(_ sender: Any) {
        print("tappedphotoButton")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    
    weak var delegate: PostViewControllerDelegate?
    
    
    //検索ボタンからGoogleに飛ぶ
    @IBAction func terms(_ sender: Any) {
        let url = URL(string: "https://google.com/")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        postTextView.text = ""
        postTextView.delegate = self
    }

}

//textの値わたし
extension PostViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print("textView.text:", textView.text)
        if textView.text.isEmpty {
            postButton.isEnabled = false
        } else {
            postButton.isEnabled = true
        }
        
    }
}

//画像 ImagePicker
extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
