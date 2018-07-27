//
//  ArticleTableViewCell.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    
    var articleImage: String?
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
    
    var articleView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.articleView.layer.cornerRadius = 10
        self.articleView.layer.masksToBounds = true
        
        self.articleView.layer.borderWidth = 1.0
        let opacity: CGFloat = 0.6
        let borderColor = UIColor.darkGray
        self.articleView.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        
        // add subviews to cell
        self.contentView.addSubview(articleView)
        articleView.addSubview(articleImageView)
        articleView.addSubview(articleTitleView)
        articleView.addSubview(articleDateView)
        
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
            articleImageView.sd_setImage(with: URL(string: i), placeholderImage: UIImage(named: "s6c"))
        }
        if let t = articleTitle {
            articleTitleView.text = t
        }
        if let d = articleDate {
            articleDateView.text = d
        }
        
    }
    
    func setupViewContraints() {
        
        // articleView
        articleView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        articleView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8).isActive = true
        articleView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8).isActive = true
        articleView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        // articleImageView
        articleImageView.topAnchor.constraint(equalTo: articleView.topAnchor, constant: 0).isActive = true
        articleImageView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 0).isActive = true
        articleImageView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: 0).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        // articleTitleView
        articleTitleView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8).isActive = true
        articleTitleView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 12).isActive = true
        articleTitleView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        
        // articleDateView
        articleDateView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 12).isActive = true
        articleDateView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        articleDateView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor, constant: -8).isActive = true
        
    }
    
}


