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
    formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

    let myString = formatter.string(from: dateObject) // string purpose I add here

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
