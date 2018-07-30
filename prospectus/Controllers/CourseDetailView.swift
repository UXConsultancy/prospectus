//
//  CourseDetailView.swift
//  prospectus
//
//  Created by Craig Chambers on 28/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import UIKit

class CourseDetailView: UIView {
    
    // instantiate views
    var imageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var typeView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .caption1)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    var boardView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .caption2)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    var CourseDescriptionTitleView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.text = "Course Description"
        return tv
    }()
    
    var courseDescriptionView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .body)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    var interestingFactTitleView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.text = "Interesting fact about studying this at S6C"
        return tv
    }()
    
    var interestingFactView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .body)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    var entryRequirementsTitleView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.text = "Entry Requirements"
        return tv
    }()
    
    var entryRequirementsView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .body)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add subviews
        self.addSubview(imageView)
        self.addSubview(typeView)
        self.addSubview(boardView)
        self.addSubview(CourseDescriptionTitleView)
        self.addSubview(courseDescriptionView)
        self.addSubview(interestingFactTitleView)
        self.addSubview(interestingFactView)
        self.addSubview(entryRequirementsTitleView)
        self.addSubview(entryRequirementsView)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        // add constraints for subViews
        
        // imageView
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        if UIDevice().userInterfaceIdiom == .pad {
            imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        } else {
            imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        
        // typeView
        typeView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6).isActive = true
        typeView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        typeView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // boardView
        boardView.topAnchor.constraint(equalTo: typeView.bottomAnchor, constant: 0).isActive = true
        boardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        boardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // CourseDescriptionTitleView
        CourseDescriptionTitleView.topAnchor.constraint(equalTo: boardView.bottomAnchor, constant: 8).isActive = true
        CourseDescriptionTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        CourseDescriptionTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // courseDescriptionView
        courseDescriptionView.topAnchor.constraint(equalTo: CourseDescriptionTitleView.bottomAnchor, constant: 0).isActive = true
        courseDescriptionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        courseDescriptionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // interestingFactTitleView
        interestingFactTitleView.topAnchor.constraint(equalTo: courseDescriptionView.bottomAnchor, constant: 8).isActive = true
        interestingFactTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        interestingFactTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // interestingFactView
        interestingFactView.topAnchor.constraint(equalTo: interestingFactTitleView.bottomAnchor, constant: 0).isActive = true
        interestingFactView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        interestingFactView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // entryRequirementsTitleView
        entryRequirementsTitleView.topAnchor.constraint(equalTo: interestingFactView.bottomAnchor, constant: 8).isActive = true
        entryRequirementsTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        entryRequirementsTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        // entryRequirementsView
        entryRequirementsView.topAnchor.constraint(equalTo: entryRequirementsTitleView.bottomAnchor, constant: 0).isActive = true
        entryRequirementsView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        entryRequirementsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        entryRequirementsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
