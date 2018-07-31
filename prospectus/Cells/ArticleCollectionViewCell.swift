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
    var articleDate: String?
    var articleBackgroundImage: String?
    
    var articleImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.clear
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var backgroundImageView: UIImageView = {
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
    
    var articleDateView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption2)
        text.backgroundColor = UIColor.clear
        text.textColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        text.textAlignment = .right
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
        view.backgroundColor = UIColor(displayP3Red: 27/255, green: 116/255, blue: 187/255, alpha: 1)
        view.layer.borderWidth = 1.5
        view.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        return view
    }()
    
    let blurEffect = UIBlurEffect(style: .light)
    
    lazy var blurView: UIVisualEffectView! = {
        var bv = UIVisualEffectView(effect: blurEffect)
        bv.translatesAutoresizingMaskIntoConstraints = false
        return bv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // add subviews to cell
        self.contentView.addSubview(articleView)
        articleView.addSubview(articleImageView)
        articleView.addSubview(backgroundImageView)

        backgroundImageView.addSubview(blurView)
        
        articleView.addSubview(articleTitleView)
        articleView.addSubview(articleDateView)
        
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
            backgroundImageView.sd_setImage(with: URL(string: i), placeholderImage: UIImage(named: "s6c"))
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
        if UIDevice().userInterfaceIdiom == .pad {
            articleImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 430).isActive = true
        } else {
            articleImageView.heightAnchor.constraint(equalToConstant: 230).isActive = true
        }
        
        // backgroundImageView
        backgroundImageView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 0).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // blurView
        blurView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 0).isActive = true
        blurView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 0).isActive = true
        blurView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0).isActive = true
        blurView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0).isActive = true
        
        // articleTitleView
        articleTitleView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 6).isActive = true
        articleTitleView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 12).isActive = true
        articleTitleView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        
        // articleDateView
        articleDateView.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 6)
        articleDateView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 12).isActive = true
        articleDateView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        articleDateView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor, constant: -6).isActive = true
        
    }
    
}


