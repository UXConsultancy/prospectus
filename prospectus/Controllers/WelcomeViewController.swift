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
    
    var docRef: CollectionReference!
    var articles: [QueryDocumentSnapshot]?
    
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
        
        
        // get data fromFirebase?
        docRef = Firestore.firestore().collection("introduction")
        getDataForIntroduction(from: docRef)
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "welcome")
    }
    
    func getDataForIntroduction(from: CollectionReference) {
        from.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.articles = querySnapshot!.documents
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let a = self.articles else { return 0 }
        return a.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "welcome", for: indexPath) as! ArticleTableViewCell
        if let text :QueryDocumentSnapshot = self.articles?[indexPath.row] {
            let article = text.data()
            let t = article["title"] as! String
            cell.articleTitle = t
            let i = article["image"] as! String
            cell.articleImage = UIImage(named: i)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        //getting the current cell from the index path
        if let text :QueryDocumentSnapshot = self.articles?[(indexPath?.row)!] {
            let article = text.data()
            vc.article = article
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

}
