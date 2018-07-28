//
//  ModelController.swift
//  prospectus
//
//  Created by Craig Chambers on 24/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import UIKit

class ModelController {
    
    var news: [Article] = []
    var welcome: [Article] = []
    var courses: [Course] = []
    
    init() {
        // Uncomment if you want to add data to the database
//        addCourse(table: .courses)
        getArticles()
    }
    
    private func getArticles() {
        // get news articles
        FBHelper.shared.read(from: .news, returning: Article.self) { (articles) in
            self.news = articles
            NotificationCenter.default.post(name: NSNotification.Name("gotNews"), object: nil)
        }
        // get introduction (welcome) articles
        FBHelper.shared.read(from: .introduction, returning: Article.self) { (articles) in
            self.welcome = articles
            NotificationCenter.default.post(name: NSNotification.Name("gotWelcome"), object: nil)
        }
        // get courses
        FBHelper.shared.read(from: .courses, returning: Course.self) { (courses) in
            self.courses = courses
            NotificationCenter.default.post(name: NSNotification.Name("gotCourses"), object: nil)
        }
    }
    
}
