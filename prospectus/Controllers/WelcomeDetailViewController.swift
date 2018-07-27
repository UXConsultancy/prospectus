//
//  WelcomeDetailViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 19/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import UIKit

class WelcomeDetailViewController: UIViewController {
    
    var article: Article!
    
    let defaultImage = UIImage(named: "s6c")
    
    var detailView: DetailView! = {
        var dv = DetailView()
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    var scrollView: UIScrollView = {
        var sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = article?.title
        self.view.backgroundColor = UIColor.white
        detailView.imageView.image = defaultImage
        
        detailView.imageView.downloadedFrom(link: article.image!)
        detailView.titleView.text = article.title
        detailView.dateView.text = article?.date
        detailView.textView.text = article?.text
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(detailView)

        setupViews()
    }

    fileprivate func setupViews() {
        
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        detailView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        detailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        detailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
}
