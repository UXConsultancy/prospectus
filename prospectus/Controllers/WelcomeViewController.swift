//
//  WelcomeViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UITableViewController {

    var articles: [Article]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set visuals for ViewController
        self.title = "Welcome"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.estimatedRowHeight = 312
        tableView.rowHeight = 324 //UITableViewAutomaticDimension
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "welcome")
        
        FBHelper.shared.read(from: .introduction, returning: Article.self) { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let a = self.articles else { return 0 }
        return a.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "welcome", for: indexPath) as! ArticleTableViewCell
        cell.articleTitle = articles[indexPath.row].title
        cell.articleDate = articles[indexPath.row].date
        cell.articleImage = UIImage(named: articles[indexPath.row].image!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        vc.article = articles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
