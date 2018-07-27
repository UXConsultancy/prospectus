//
//  AddDataToDataBaseForTesting.swift
//  prospectus
//
//  Created by Craig Chambers on 27/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import UIKit

var title = "Welcome to S6C"
var date = "27/08/18 18:39"
var featured = false
var image = "https://firebasestorage.googleapis.com/v0/b/prospectus-f2184.appspot.com/o/gemma.jpg?alt=media&token=2e5f3111-ade8-4b28-ac14-902932648586"
var text = "Since Salisbury 6th Form College opened in 2104, it has consistently delivered successful results both in A level subjects and vocational qualifications. This is a true reflection of the hard-working members of staff we are lucky to have in the college community who are all incredibly passionate about the subjects they teach. They strive to support you and push you to your full potential. However, it's not merely the results obtained at the end of Year 13 by the students that makes a college great.\\n\\nI chose to study at S6C because of the college's friendly atmosphere and strong working environment. The Induction Day was the first time I visited S6C and the moment I stepped inside the doors I knew that this was the place I wanted to be. As the day continued this feeling was only reaffirmed and I decided I was going to throw myself in at the deep end and get actively involved in the College as much as I possibly could.\n\nThat is exactly what I've done this past year and it has been incredible! Getting involved in the college community and seizing the opportunities on offer reaps its own benefits. There are many opportunities to contribute to the positive ethos of the college; over the past year I have been involved in particularly with Student Voice which enables the students to have a say on how the College is run. This ensures that the college environment is tailored to the needs of all the students which maximises our ability to thrive and flourish during the crucial stage of our education. It's also incredibly rewarding to see your ideas being taken on board and put into action. This really demonstrates how, at S6C, you are truly valued as an individual and recognised as someone with a future and your own personal goals which the staff are all eager to help you pursue.\n\nGemma Hayden\nStudent President, 2018-19"

func setupArticle() -> Article {
    let article = Article()
    article.title = title
    article.date = date
    article.featured = featured
    article.image = image
    article.text = text
    
    return article
}

func uploadData(article: Article, collection: FBCollectionReference) {
    FBHelper.shared.create(for: article, in: collection)
}

func doIt(table: FBCollectionReference) {
    let story = setupArticle()
    uploadData(article: story, collection: table)
}

