//
//  WelcomeViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    var docRef: CollectionReference!
    var articles: [QueryDocumentSnapshot]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set visuals for ViewController
        self.title = "Welcome"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // get data fromFirebase?
        docRef = Firestore.firestore().collection("introduction")
        getDataForIntroduction(from: docRef)
    }
    
    func getDataForIntroduction(from: CollectionReference) {
        from.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for article in querySnapshot!.documents {
                    print("\(article.documentID) => \(article.data())")
                }
                self.articles = querySnapshot!.documents
            }
        }
    }

}
