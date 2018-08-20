//
//  CoursesViewController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var modelController: ModelController!
    var courses: [Course]! = []
    
    let courseCellId = "courseCell"
    
    lazy var coursesView: UITableView = {
        var tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(NewsCell.self, forCellReuseIdentifier: courseCellId)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelController = ModelController()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Courses"
        view.backgroundColor = UIColor.white

        view.addSubview(coursesView)
        
        setupViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollection), name: NSNotification.Name("gotCourses"), object: nil)
    }
    
    @objc func reloadCollection() {
        courses = modelController.courses
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        courses.sort(by: { $0.title!  < $1.title! })
        coursesView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: courseCellId, for: indexPath) as! NewsCell
        cell.articleTitle = courses[indexPath.row].title
        cell.articleImage = courses[indexPath.row].image
        cell.articleDate = courses[indexPath.row].examBoard
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CourseDetailViewController()
        vc.course = courses[indexPath.row]
        coursesView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func setupViews() {
        
        //coursesView
        coursesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        coursesView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        coursesView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        coursesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
}
