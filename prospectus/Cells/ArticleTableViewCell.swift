//
//  ArticleTableViewCell.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    var articleImage: UIImage?
    var articleTitle: String?
    var articleDate: String?
    
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
        return text
    }()
    
    var articleDateView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption2)
        text.textAlignment = .right
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add subviews to cell
        self.contentView.addSubview(articleImageView)
        self.contentView.addSubview(articleTitleView)
        self.contentView.addSubview(articleDateView)
        
        setupViewContraints()
        let w = self.contentView.bounds.width
        let h = self.contentView.bounds.height
        print("width = \(w), height = \(h)")
        layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let i = articleImage {
            articleImageView.image = i
        }
        if let t = articleTitle {
            articleTitleView.text = t
        }
//        if let d = articleDate {
            articleDateView.text = "Testing"//d
//        }
        
    }
    
    func setupViewContraints() {
        
        // articleImageView
        articleImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        articleImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        articleImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
////        articleImageView.bottomAnchor.constraint(equalTo: articleTitleView.topAnchor, constant: 8).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        // articleTitleView
        articleTitleView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8).isActive = true
        articleTitleView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
        articleTitleView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12).isActive = true
//        articleTitleView.bottomAnchor.constraint(equalTo: articleDateView.topAnchor, constant: 0).isActive = true
//        articleTitleView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // articleDateView
//        articleDateView.topAnchor.constraint(equalTo: articleTitleView.bottomAnchor, constant: 0).isActive = true
        articleDateView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        articleDateView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
//        articleDateView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        articleDateView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        
    }
    
}
