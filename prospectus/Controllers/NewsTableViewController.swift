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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.rowHeight = 40
        modelController = ModelController()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "news")
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("gotNews"), object: nil)
    }
    
    @objc func reloadData() {
        self.news = modelController.news
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news", for: indexPath)
        cell.textLabel?.text = news[indexPath.row].title
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