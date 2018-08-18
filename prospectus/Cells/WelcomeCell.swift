//
//  WelcomeCell.swift
//  prospectus
//
//  Created by Craig Chambers on 17/08/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class WelcomeCell: UICollectionViewCell {
    
    let mainView: UIView = {
        var mv = UIView()
        mv.backgroundColor = .blue
        return mv
    }()
    
    let titleText: UITextView = {
        var tv = UITextView()
        tv.text = "Test"
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(mainView)
        mainView.addSubview(titleText)

        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        titleText.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 6).isActive = true
        titleText.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 6).isActive = true
        titleText.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 6).isActive = true
        titleText.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 6).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
