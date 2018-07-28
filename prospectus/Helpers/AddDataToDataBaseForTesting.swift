//
//  AddDataToDataBaseForTesting.swift
//  prospectus
//
//  Created by Craig Chambers on 27/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation
import UIKit

var title = "Art and Design: Fine Art"
var date = "28/08/18 10:32"
var featured = false
var image = "https://firebasestorage.googleapis.com/v0/b/prospectus-f2184.appspot.com/o/art.jpg?alt=media&token=decc17fe-e446-4719-8f59-80e64e4c87f3"
var text = "The Art & Design course in Fine Art is designed to strengthen and build on the skills, techniques and processes acquired at CGSE Art & Design such as: recording ideas and observations, developing work informed by artists, designers and craftspeople, experimenting with media and materials and reviewing and refining work\n\nThrough taught lessons, workshops and independant study, you will be introduced to a variety of experiences exploring a range of art media, techniques and processes and be made aware of traditional and new technologies. These will include painting and drawing, mixed media, sculpture, printmaking, animation, video and photography.\n\nYou should be aware of the importance of research and you will are encouraged to explore methods for developing themes and ideas.\n\n\tYou will be able to demonstrate knowledge and understanding in the appreciation of different approaches to recording images, such as observation, analysis and expression\n\n\tYou will be able to recognise different ways of working, such as using underpainting, glazing, wash and impasto, modelling, assembling, mono printing, lino printing and screen printing\n\n\tYou will develop an understanding of space, composition, rhythm, scale and structure.\n\n\tYou will be able to recognise and critically analyse and interpret the visual elements\n\n"

var entryRequirements = "To study this course you will need to meet the overall entry requirements for Pathway 1 or 2 including a grade 6 or above in CGSE Art & Design or an equivalent qualification, or a technology subject such as Graphic Products or Textiles.\n\nWe will ask you to bring a portfolio of your work to your interview. Consideration will be given to those who have not studied an Art or Design course at school or who have achieved a grade 5, in this case a portfolio of work must be provided at your interview.\n\nsalisbury6c.ac.uk/courses/art-and-design-fine-art/\n\n"
var examBoard = "AQA"
var fact = "You will be offered a range of opportunities in Fine Art such as:\n\tWorking to live briefs - last year students designed and made the backdrop to a 60's inspired music event\n\tTaking part in local competitions\n\tMini masterclasses\n\tGuest speakers from the creative industry.\n\n"
var type = "A Level"


func setupArticle() -> Article {
    let article = Article()
    article.title = title
    article.date = date
    article.featured = featured
    article.image = image
    article.text = text
    
    return article
}

func setupCourse() -> Course {
    let course = Course()
    course.title = title
    course.entryRequirements = entryRequirements
    course.examBoard = examBoard
    course.fact = fact
    course.type = type
    course.date = date
    course.featured = featured
    course.image = image
    course.text = text
    return course
}

func uploadArticle(article: Article, collection: FBCollectionReference) {
    FBHelper.shared.create(for: article, in: collection)
}

func uploadCourse(course: Course, collection: FBCollectionReference) {
    FBHelper.shared.create(for: course, in: collection)
}

func addArticle(table: FBCollectionReference) {
    let story = setupArticle()
    uploadArticle(article: story, collection: table)
}

func addCourse(table: FBCollectionReference) {
    let story = setupCourse()
    uploadCourse(course: story, collection: table)
}

