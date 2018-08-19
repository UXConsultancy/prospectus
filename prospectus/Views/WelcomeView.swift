//
//  WelcomeView.swift
//  prospectus
//
//  Created by Craig Chambers on 19/08/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class WelcomeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var articles: [Article]! = []
    var modelController: ModelController!
    
    let layout: UICollectionViewFlowLayout = {
        var l = UICollectionViewFlowLayout()
//        l.scrollDirection = .horizontal // not making a difference!
        return l
    }()
    
    lazy var collectionView: UICollectionView = {
        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.setCollectionViewLayout(layout, animated: true)
        cv.delegate = self
        cv.dataSource = self
        cv.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: "welcomeCell")
        cv.backgroundColor = .yellow //remove after debug
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green //remove after debug
        addSubview(collectionView)
        
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotCourses"), object: nil)
    }
    
    @objc func reloadCollection() {
        self.articles = modelController.welcome
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.articles.sort(by: { formatter.date(from: $0.date!)!  < formatter.date(from: $1.date!)! })
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "welcomeCell", for: indexPath) as! ArticleCollectionViewCell
        cell.articleTitle = self.articles[indexPath.row].title
        cell.articleImage = self.articles[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        vc.article = articles[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupViews() {
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
//        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
