//
//  NewsTableViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set visuals for ViewController
        self.title = "News"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }

}
