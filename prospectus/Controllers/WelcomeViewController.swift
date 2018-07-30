//
//  WelcomeViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class WelcomeViewController: UITableViewController {

    var modelController: ModelController!
    var articles: [Article]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        modelController = ModelController()
        
        // Set visuals for ViewController
        self.title = "welcome"
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = UIColor.white
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        tableView.estimatedRowHeight = 324
        if UIDevice().userInterfaceIdiom == .pad {
            tableView.rowHeight = 500
        } else {
        tableView.rowHeight = 324 //UITableViewAutomaticDimension
//        tableView.rowHeight = UITableViewAutomaticDimension
        }
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "welcome")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name("gotWelcome"), object: nil)

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
    
    @objc func reloadTable() {
        self.articles = modelController.welcome
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let a = self.articles else { return 0 }
        return a.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "welcome", for: indexPath) as! ArticleTableViewCell
        cell.articleTitle = articles[indexPath.row].title
        cell.articleDate = articles[indexPath.row].date
        cell.articleImage = articles[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        vc.article = articles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
