//
//  TestWelcome.swift
//  prospectus
//
//  Created by Craig Chambers on 31/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    var modelController: ModelController!
    var articles: [Article]! = []
    var news: [Article]! = []
    
    var welcomeCellId = "welcomeCell"
    var newsCellId = "newsCell"
    
    let layout: UICollectionViewFlowLayout = {
        var l = UICollectionViewFlowLayout()
        return l
    }()
    
    lazy var collectionView: UICollectionView = {
        var cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.setCollectionViewLayout(layout, animated: true)
        cv.delegate = self
        cv.dataSource = self
        cv.register(ArticleCollectionViewCell.self, forCellWithReuseIdentifier: welcomeCellId)
        return cv
    }()
    
    lazy var newsView: UITableView = {
        var nv = UITableView()
        nv.translatesAutoresizingMaskIntoConstraints = false
        nv.delegate = self
        nv.dataSource = self
        nv.register(NewsCell.self, forCellReuseIdentifier: newsCellId)
        return nv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        modelController = ModelController()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "S6C Prospectus"
        self.view.backgroundColor = UIColor.white
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView.delegate = self
        
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        view.addSubview(newsView)
        
        let tableHeaderCell = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        tableHeaderCell.backgroundColor = .red
        tableHeaderCell.addSubview(collectionView)
        newsView.tableHeaderView = tableHeaderCell
        
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotCourses"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotNews"), object: nil)

    }

    @objc func reloadCollection() {
        self.articles = modelController.welcome
        self.news = modelController.news
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.articles.sort(by: { formatter.date(from: $0.date!)!  < formatter.date(from: $1.date!)! })
        self.news.sort(by: { formatter.date(from: $0.date!)!  < formatter.date(from: $1.date!)! })
        self.collectionView.reloadData()
        newsView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getLayoutSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return -5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: welcomeCellId, for: indexPath) as! ArticleCollectionViewCell
        cell.articleTitle = self.articles[indexPath.row].title
        cell.articleImage = self.articles[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = WelcomeDetailViewController()
        vc.article = articles[indexPath.row]
        collectionView.selectItem(at: nil, animated: true, scrollPosition: [])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupViews() {

        collectionView.topAnchor.constraint(equalTo: (newsView.tableHeaderView?.topAnchor)!, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: (newsView.tableHeaderView?.leadingAnchor)!, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: (newsView.tableHeaderView?.trailingAnchor)!, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        newsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        newsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        newsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        newsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellId, for: indexPath) as! NewsCell
        cell.articleTitle = news[indexPath.row].title
        cell.articleDate = news[indexPath.row].date
        cell.articleImage = news[indexPath.row].image!
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    fileprivate func getLayoutSize() -> CGSize {
        let cellScaling: CGFloat = 0.95
        let screenSize = UIScreen.main.bounds
        let cellWidth = floor(screenSize.width * cellScaling)
        let cellHeight = floor(collectionView.bounds.height * cellScaling) / cellScaling
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsDetailViewController()
        vc.article = news[indexPath.row]
        newsView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}
