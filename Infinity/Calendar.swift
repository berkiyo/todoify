//
//  Calendar.swift
//  Infinity
//
//  Created by Berk Dogan on 26/11/2022.
//

import Foundation

// Inspired by --> https://sarunw.com/posts/getting-number-of-days-between-two-dates/

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}
