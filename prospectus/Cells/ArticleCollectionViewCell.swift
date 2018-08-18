//
//  ArticleTableViewCell.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCollectionViewCell: UICollectionViewCell {
    
    var articleImage: String?
    var articleTitle: String?
//    var articleDate: String?
//    var articleBackgroundImage: String?
    
    var articleImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.clear
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var articleTitleView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        text.backgroundColor = UIColor.clear
        text.textColor = UIColor(displayP3Red: 255/255, green: 250/255, blue: 250/255, alpha: 1)
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    let opacity: CGFloat = 0.6
    let borderColor = UIColor.darkGray
    
    lazy var articleView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1.5
        view.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        // add subviews to cell
        self.contentView.addSubview(articleView)
        articleView.addSubview(articleImageView)
        articleView.addSubview(articleTitleView)

        setupViewContraints()
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
        articleImageView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor, constant: 0).isActive = true

        // articleTitleView
        articleTitleView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 12).isActive = true
        articleTitleView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        articleTitleView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor, constant: -6).isActive = true
        articleTitleView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
}


