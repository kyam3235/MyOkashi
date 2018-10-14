//
//  ViewController.swift
//  MyOkashi
//
//  Created by Kyohei Yamaguchi on 2018/10/14.
//  Copyright © 2018年 Kyohei Yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //SearchBarのDelegate通知先を設定
        searchText.delegate = self
        //入力のヒントになるプレースホルダを設定
        searchText.placeholder = "お菓子の名前を入力してください"
    }

    @IBOutlet weak var searchText: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    //検索ボタンをタップ
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //キーボードを閉じる
        view.endEditing(true)
        
        if let searchWord = searchBar.text{
            //デバッグエリアに出力
            print(searchWord)
            //お菓子を検索
            searchOkashi(keyword: searchWord)
        }
    }
    
    func searchOkashi(keyword: String){
        //お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else{
            return
        }
        
        //リクエストURLの組み立て
        guard let req_url = URL(string: "http://www.sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}

