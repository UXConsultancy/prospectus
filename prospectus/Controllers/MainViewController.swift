//
//  MainViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/08/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let welcomeCellID = "welcome"
    private var articles: [Article] = []
    
    lazy var collectionView: UICollectionView = {
        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(WelcomeCell.self, forCellWithReuseIdentifier: welcomeCellID)
        
        return cv
    }()
    
    func createSampleData() {
        let article = Article()
        article.date = "29/12/1967 10:00"
        article.featured = false
        article.image = "s6c"
        article.text = "This is a test article, this text will be longer!"
        article.title = "test article"
        articles.append(article)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSampleData()
        
        self.title = "S6C Prospectus"
        self.view.backgroundColor = .yellow
        
        view.addSubview(collectionView)
        setupViews()
        
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: welcomeCellID, for: indexPath) as! WelcomeCell
        cell.titleText.text = articles[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 200)
    }
    
    func setupViews() {
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 6).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 6).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 6).isActive = true
        
        
        
    }
}
