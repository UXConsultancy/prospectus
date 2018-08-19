//
//  TestNews.swift
//  prospectus
//
//  Created by Craig Chambers on 31/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var modelController: ModelController!
    var news: [Article]! = []
    
    let layout: UICollectionViewFlowLayout = {
        var l = UICollectionViewFlowLayout()
        l.scrollDirection = UICollectionViewScrollDirection.vertical
        return l
    }()
    
    lazy var collectionView: UICollectionView = {
        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.setCollectionViewLayout(layout, animated: true)
        cv.delegate = self
        cv.dataSource = self
        cv.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "newsCell")
        cv.backgroundColor = UIColor.white
        cv.delegate = self
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
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "Welcome"
        self.view.backgroundColor = UIColor.white

        self.view.addSubview(searchBar)
        self.view.addSubview(collectionView)
        
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotCourses"), object: nil)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }
    
    @objc func reloadCollection() {
        self.news = modelController.news
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.news.sort(by: { formatter.date(from: $0.date!)!  < formatter.date(from: $1.date!)! })
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getLayoutSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! ArticleCollectionViewCell
        cell.articleTitle = self.news[indexPath.row].title
        cell.articleImage = self.news[indexPath.row].image
//        cell.articleDate = self.news[indexPath.row].date
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        vc.article = news[indexPath.row]
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
            var width = (self.view.bounds.width / 3)-20
            if UIDevice().userInterfaceIdiom == .pad {
                if UIDevice.current.orientation == .portrait {
                    width = (self.view.bounds.width / 2)-20
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

