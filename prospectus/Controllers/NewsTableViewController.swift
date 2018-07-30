//
//  NewsTableViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var modelController: ModelController!
    var news: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set visuals for ViewController
        self.title = "News"
        self.view.backgroundColor = UIColor.white
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        if UIDevice().userInterfaceIdiom == .pad {
            tableView.rowHeight = 500
        } else {
            tableView.rowHeight = 324 //UITableViewAutomaticDimension
            //        tableView.rowHeight = UITableViewAutomaticDimension
        }
        modelController = ModelController()
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "news")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("gotNews"), object: nil)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }
    
    @objc func reloadData() {
        self.news = modelController.news
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as! ArticleTableViewCell
        cell.articleTitle = news[indexPath.row].title
        cell.articleDate = news[indexPath.row].date
        cell.articleImage = news[indexPath.row].image
//        cell.textLabel?.text = news[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailViewController()
        vc.article = news[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
