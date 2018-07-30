//
//  CourseCollectionViewCell.swift
//  prospectus
//
//  Created by Craig Chambers on 28/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import SDWebImage

class CourseCollectionViewCell: UICollectionViewCell {
    
    var courseImage: String?
    var courseTitle: String?
    var courseType: String?
    var courseBoard: String?
    var courseBackgroundImage: String?
    
    var courseImageView: UIImageView = {
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
    
    var courseTitleView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .headline)
        text.backgroundColor = UIColor.clear
        text.textColor = UIColor.white
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    var courseBoardView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption2)
        text.backgroundColor = UIColor.clear
        text.textColor = UIColor.white
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    var courseTypeView: UITextView = {
        var text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.preferredFont(forTextStyle: .caption2)
        text.backgroundColor = UIColor.clear
        text.textColor = UIColor.white
        text.isEditable = false
        text.isScrollEnabled = false
        return text
    }()
    
    var courseView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var blurView: UIVisualEffectView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // cell styling
        self.courseView.layer.cornerRadius = 10
        self.courseView.layer.masksToBounds = true
        self.courseView.backgroundColor = UIColor.clear
        
        self.courseView.layer.borderWidth = 1.5
        let opacity: CGFloat = 0.6
        let borderColor = UIColor.darkGray
        self.courseView.layer.borderColor = borderColor.withAlphaComponent(opacity).cgColor
        
        // add subviews to cell
        self.contentView.addSubview(courseView)
        courseView.addSubview(courseImageView)
        courseView.addSubview(backgroundImageView)
        
        let blurEffect = UIBlurEffect(style: .regular)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(blurView)
        
        courseView.addSubview(courseTitleView)
        courseView.addSubview(courseTypeView)
        courseView.addSubview(courseBoardView)
        
        setupViewContraints()
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let i = courseImage {
            courseImageView.sd_setImage(with: URL(string: i), placeholderImage: UIImage(named: "s6c"))
            backgroundImageView.sd_setImage(with: URL(string: i), placeholderImage: UIImage(named: "s6c"))
        }
        if let t = courseTitle {
            courseTitleView.text = t
        }
        if let b = courseBoard {
            courseBoardView.text = b
        }
        if let t = courseType {
            courseTypeView.text = t
        }
        
    }
    
    func setupViewContraints() {
        
        // courseView
        courseView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        courseView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        courseView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        courseView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        // courseImageView
        courseImageView.topAnchor.constraint(equalTo: courseView.topAnchor, constant: 0).isActive = true
        courseImageView.leftAnchor.constraint(equalTo: courseView.leftAnchor, constant: 0).isActive = true
        courseImageView.rightAnchor.constraint(equalTo: courseView.rightAnchor, constant: 0).isActive = true
        courseImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 200).isActive = true
        
        // backgroundImageView
        backgroundImageView.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 0).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: courseView.leadingAnchor, constant: 0).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: courseView.trailingAnchor, constant: 0).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: courseView.bottomAnchor, constant: 0).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // blurView
        blurView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 0).isActive = true
        blurView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 0).isActive = true
        blurView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 0).isActive = true
        blurView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0).isActive = true
        
        // courseTitleView
        courseTitleView.topAnchor.constraint(equalTo: courseImageView.bottomAnchor, constant: 0).isActive = true
        courseTitleView.leftAnchor.constraint(equalTo: courseView.leftAnchor, constant: 12).isActive = true
        courseTitleView.rightAnchor.constraint(equalTo: courseView.rightAnchor, constant: -12).isActive = true
        
        // courseBoardView
        courseBoardView.topAnchor.constraint(equalTo: courseTitleView.bottomAnchor, constant: -8).isActive = true
        courseBoardView.leftAnchor.constraint(equalTo: courseView.leftAnchor, constant: 12).isActive = true
        
        
        // courseTypeView
        courseTypeView.topAnchor.constraint(equalTo: courseTitleView.bottomAnchor, constant: -8).isActive = true
        courseTypeView.leftAnchor.constraint(equalTo: courseBoardView.rightAnchor, constant: 12).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
