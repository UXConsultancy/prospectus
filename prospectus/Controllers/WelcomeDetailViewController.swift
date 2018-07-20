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

    var scrollView: UIScrollView = {
        var sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.clipsToBounds = true
//        sv.backgroundColor = UIColor.green
        return sv
    }()
    
    var articleImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var articleTitleView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        text.isEditable = false
        text.isScrollEnabled = false
        //text.isSelectable = false
        return text
    }()
    
    var articleDateView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption2)
        text.textAlignment = .right
        text.isEditable = false
        text.isScrollEnabled = false
        text.isSelectable = false
        return text
    }()
    
    var articleTextView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption1)
        text.isEditable = false
        text.isScrollEnabled = false
        text.isSelectable = false
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = article.title
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.contentMode = .scaleToFill
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(articleImageView)
        scrollView.addSubview(articleTextView)
        
        self.articleImageView.image = UIImage(named: article.image!)
        self.articleTextView.text = article.text
        
        setupViewContraints()
    }
    
    func setupViewContraints() {
        
        // scrollView
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        // articleImageView
        articleImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 0).isActive = true
        articleImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 0).isActive = true
        articleImageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 0).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        articleImageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: 0).isActive = true
        
        //articleTextView
        articleTextView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 12).isActive = true
        articleTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 12).isActive = true
        articleTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -12).isActive = true
        articleTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -12).isActive = true
        articleTextView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, constant: 100)
        
    }
}
