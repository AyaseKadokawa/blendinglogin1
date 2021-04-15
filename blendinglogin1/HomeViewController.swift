//
//  HomeViewController.swift
//  blendinglogin1
//
//  Created by 広瀬綾香 on 2021/04/01.
//


import UIKit

class HomeViewController: UIViewController {
    
    private let cellId = "CellId"
    
    //Postから値渡し：うまくいかん
//    private lazy var postViewController: PostViewController = {
//        let viewController = PostViewController()
//        viewController.delegate = self
//        return viewController
//    }()
    
    
    
    @IBOutlet weak var timelineTableView: UITableView!
    
    //テーブル表示上のデータソース
    var tweets: [Tweet] = [ ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    timelineTableView.delegate = self
    timelineTableView.dataSource = self
        timelineTableView.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    //投稿PostViewControllerとの画面遷移
    //キャンセルを押したらHomeに戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}

//PostViewControllerからHome？に値渡し Delegate：うまくいかん
//extension HomeViewController: PostViewControllerDelegate {
//
//    func tappedpostButton(text: String) {
//        print("postViewControllerDelegate text: ", text)
//    }
//
//}



//MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
 
//高さ
    //1.高さを見積もって設定
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //2.高さ80に設定
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
    
    
//表示ツイートの数
    //1.何個あるか数えて設定
    // 何個のcellを生成するかを設定する関数
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // tweetsの配列内の要素数分を指定
//        return tweets.count
//    }
    
    //2.10個に設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timelineTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
}

