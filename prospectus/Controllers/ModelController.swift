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
    
    init() {
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
    }
}
