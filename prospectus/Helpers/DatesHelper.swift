//
//  DatesHelper.swift
//  prospectus
//
//  Created by Craig Chambers on 20/07/2018.
//  Copyright © 2018 Craig Chambers. All rights reserved.
//

import Foundation

func convertDateToString(dateObject: Date) -> String {

    let formatter = DateFormatter()
    // initially set the format based on your datepicker date / server String
    formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

    let myString = formatter.string(from: dateObject) // string purpose I add here
//    // convert your string to date
//    let yourDate = formatter.date(from: myString)
//    //then again set the date format whhich type of output you need
//    formatter.dateFormat = "dd-MMM-yyyy"
//    // again convert your date to string
//    let myStringafd = formatter.string(from: yourDate!)

    return myString
}

func convertStringToDate(string: String) -> Date? {
    let formatter = DateFormatter()
    guard let date = formatter.date(from: string) else {return nil}
    return date
}

func convertTimestamp(serverTimestamp: Double) -> String {
    let x = serverTimestamp / 1000
    let date = NSDate(timeIntervalSince1970: x)
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .medium
    
    return formatter.string(from: date as Date)
}
