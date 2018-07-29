//
//  CoursesViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var modelController: ModelController!
    var courses: [Course]! = []
    
    let layout: UICollectionViewFlowLayout = {
        var l = UICollectionViewFlowLayout()
        return l
    }()

    let collectionView: UICollectionView = {
        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let searchBar: UISearchBar = {
        var sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.backgroundColor = UIColor(displayP3Red: 27/255, green: 116/255, blue: 187/255, alpha: 1)
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelController = ModelController()
        
        self.title = "Courses"
        self.view.backgroundColor = UIColor.white
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView.delegate = self
        
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CourseCollectionViewCell.self, forCellWithReuseIdentifier: "courseCell")

        self.view.addSubview(searchBar)
        self.view.addSubview(collectionView)
        
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotCourses"), object: nil)
    }
    
    @objc func reloadCollection() {
        self.courses = modelController.courses
        self.collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getLayoutSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as! CourseCollectionViewCell
        cell.courseBoard = self.courses[indexPath.row].examBoard
        cell.courseTitle = self.courses[indexPath.row].title
        cell.courseImage = self.courses[indexPath.row].image
        cell.courseType = self.courses[indexPath.row].type
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CourseDetailViewController()
        vc.course = courses[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupViews() {
        
        searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    fileprivate func getLayoutSize() -> CGSize {
        if (self.view.traitCollection.verticalSizeClass == .regular && self.view.traitCollection.horizontalSizeClass == .compact) {
            let width = (self.view.bounds.width / 1)-20
            let height = width / 1.25
            return CGSize(width: width, height: height)
        } else if (self.view.traitCollection.verticalSizeClass == .regular && self.view.traitCollection.horizontalSizeClass == .regular) {
            var width = (self.view.bounds.width / 5)-20
            if UIDevice().userInterfaceIdiom == .pad {
                if UIDevice.current.orientation == .portrait {
                    width = (self.view.bounds.width / 3)-20
                }
            }
            let height = width / 1.25
            return CGSize(width: width, height: height)
        } else if (self.view.traitCollection.verticalSizeClass == .compact && self.view.traitCollection.horizontalSizeClass == .regular) {
            let width = (self.view.bounds.width / 2)-20
            let height = width / 1.25
            return CGSize(width: width, height: height)
        } else if (self.view.traitCollection.verticalSizeClass == .compact && self.view.traitCollection.horizontalSizeClass == .compact) {
            var width = (self.view.bounds.width / 2)-20
            if UIDevice().userInterfaceIdiom == .phone {
                if UIScreen.main.nativeBounds.height == 2436 {
                    width = (self.view.bounds.width / 2)-60
                }
            }
            let height = width / 1.25
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: self.view.bounds.width-20, height: self.view.bounds.width-20*1.25)
        }
    }
    
}
