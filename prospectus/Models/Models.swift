//
//  Models.swift
//  prospectus
//
//  Created by Craig Chambers on 18/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation

class Article: NSObject {
    
    var id: String?
    var date: Date?
    var image: String?
    var featured: Bool?
    var title: String?
    var text: String?
    
}

class Course: Article {
    
    var examBoard: String?
    var entryRequirements: String?
    var fact: String?
    var type: String?
    
}
