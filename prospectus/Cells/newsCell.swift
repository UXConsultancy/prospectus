//
//  newsCell.swift
//  prospectus
//
//  Created by Craig Chambers on 19/08/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var articleImage: String?
    var articleTitle: String?
    var articleDate: String?
    
    var articleImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.clear
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        return image
    }()
    
    var articleTitleView: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    var articleDateView: UILabel = {
        var text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .subheadline)
        text.backgroundColor = UIColor.clear
        return text
    }()
    
    lazy var articleView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.clear
//        view.layer.borderWidth = 1.5
//        view.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // add subviews to cell
        self.contentView.addSubview(articleView)
        articleView.addSubview(articleImageView)
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
        articleView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4).isActive = true
        articleView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 4).isActive = true
        articleView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -4).isActive = true
        articleView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        
        // articleImageView
        articleImageView.topAnchor.constraint(equalTo: articleView.topAnchor, constant: 6).isActive = true
        articleImageView.leftAnchor.constraint(equalTo: articleView.leftAnchor, constant: 6).isActive = true
//        articleImageView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: 0).isActive = true
        articleImageView.bottomAnchor.constraint(equalTo: articleView.bottomAnchor, constant: -6).isActive = true
        articleImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        articleImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // articleTitleView
        articleTitleView.leftAnchor.constraint(equalTo: articleImageView.rightAnchor, constant: 12).isActive = true
        articleTitleView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        articleTitleView.topAnchor.constraint(equalTo: articleView.topAnchor, constant: 0).isActive = true
        articleTitleView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        // articleDateView
//        articleDateView.leftAnchor.constraint(greaterThanOrEqualTo: articleImageView.leftAnchor).isActive = true
        articleDateView.leftAnchor.constraint(equalTo: articleImageView.rightAnchor, constant: 12).isActive = true
        articleDateView.rightAnchor.constraint(equalTo: articleView.rightAnchor, constant: -12).isActive = true
        articleDateView.topAnchor.constraint(equalTo: articleTitleView.bottomAnchor, constant: 0).isActive = true
        articleDateView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
}
