//
//  DetailView.swift
//  prospectus
//
//  Created by Craig Chambers on 26/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class DetailView: UIView {

    // instantiate views
    let imageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleView: UITextView = {
        var tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.preferredFont(forTextStyle: .headline)
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    let dateView: UITextView = {
        var dv = UITextView()
        dv.translatesAutoresizingMaskIntoConstraints = false
        dv.textAlignment = .right
        dv.font = UIFont.preferredFont(forTextStyle: .caption2)
        dv.isEditable = false
        dv.isScrollEnabled = false
        return dv
    }()
    
    let textView: UITextView = {
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
        self.addSubview(titleView)
        self.addSubview(dateView)
        self.addSubview(textView)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        // titleView
        titleView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12).isActive = true
        titleView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12).isActive = true
        titleView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12).isActive = true
        
        // dateView
        dateView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 12).isActive = true
        dateView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12).isActive = true
        dateView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -12).isActive = true
        
        // textView
        textView.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 12).isActive = true
        textView.leadingAnchor.constraint(equalTo: dateView.leadingAnchor, constant: 0).isActive = true
        textView.trailingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true

    }

}
