//
//  CourseDetailViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 28/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit
import SDWebImage

class CourseDetailViewController: UIViewController {

    var course: Course! {
        didSet {
            detailView.imageView.sd_setImage(with: URL(string: course.image!), placeholderImage: UIImage(named: "s6c"))
            detailView.boardView.text = course.examBoard
            detailView.courseDescriptionView.text = course.text
            detailView.entryRequirementsView.text = course.entryRequirements
            detailView.interestingFactView.text = course.fact
            detailView.typeView.text = course.type
        }
    }
    
    var detailView: CourseDetailView! = {
        var dv = CourseDetailView()
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    var scrollView: UIScrollView = {
        var sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var addFavouriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = course?.title
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        addFavouriteButton = UIBarButtonItem(image: UIImage(named: "favourites_light")!, style: .plain, target: self, action:#selector(CourseDetailViewController.btnAddFavourite))
        self.navigationItem.rightBarButtonItem = addFavouriteButton
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        
        setupViews()
    }
    
    var selected: Bool? = false
    @objc func btnAddFavourite() {
        switch selected {
        case nil, true:
            addFavouriteButton.image = UIImage(named: "favourites_light")!
            selected = false
        case false:
            addFavouriteButton.image = UIImage(named: "favourites_dark")!
            selected = true
        default:
            print("error")
        }
    }
    
    @objc func refreshView() {
        self.detailView.imageView.setNeedsLayout()
        self.detailView.imageView.layoutIfNeeded()
    }
    
    fileprivate func setupViews() {
        
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        detailView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        detailView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        detailView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }

}
