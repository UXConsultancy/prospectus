//
//  FirebaseHelper.swift
//  prospectus
//
//  Created by Craig Chambers on 20/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import Firebase

var articleCollection: [Article] = []

func getDataFromFirebaseCollection(collection: String) -> [Article] {

    let db = Firestore.firestore()
    let collectionReference = db.collection("introduction");
    collectionReference.getDocuments(source: .cache) { (collection, error) in
        guard let test = collection else {return}
        let articles = test.documents
        for article in articles {
            let a = article.data()
            
            let article = Article()
            article.title = a["title"] as? String
            article.date = a["date"] as? String
            article.featured = a["featured"] as? Bool
            article.image = a["image"] as? String
            article.text = a["text"] as? String
            articleCollection.append(article)
        }
    }
    return articleCollection
}
