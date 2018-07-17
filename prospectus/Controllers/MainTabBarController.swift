//
//  MainTabBarController.swift
//  prospectus
//
//  Created by Craig Chambers on 17/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let newsTabBarItem:UITabBarItem = UITabBarItem(title: "News", image: UIImage(named: "news_dark"), selectedImage: UIImage(named: "news_light"))
    let coursesTabBarItem:UITabBarItem = UITabBarItem(title: "Courses", image: UIImage(named: "courses_dark"), selectedImage: UIImage(named: "courses_light"))
    let favouritesTabBarItem:UITabBarItem = UITabBarItem(title: "Favourites", image: UIImage(named: "favourites_dark"), selectedImage: UIImage(named: "favourites_light"))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up tab bar items
        self.tabBarItem = newsTabBarItem
        self.tabBarItem = coursesTabBarItem
        self.tabBarItem = favouritesTabBarItem
        
        let newsViewController = NewsTableViewController()
        newsViewController.tabBarItem = newsTabBarItem
        let coursesViewController = CoursesViewController()
        coursesViewController.tabBarItem = coursesTabBarItem
        let favouritesViewControllers = FavouritesViewController()
        favouritesViewControllers.tabBarItem = favouritesTabBarItem
        
        let viewControllerList = [ newsViewController, coursesViewController, favouritesViewControllers ]
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0)}
    }

}
