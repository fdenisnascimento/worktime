//
//  Extensions.swift
//  worktime
//
//  Created by Denis Nascimento on 01/11/18.
//  Copyright © 2018 Denis Nascimento. All rights reserved.
//
import Foundation

extension String {
    
    func toDate(dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date: Date? = dateFormatter.date(from: self)
        return date
    }
}

extension Date {
    
    public func toString(dateFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date: String? = dateFormatter.string(from: self)
        return date
    }
}
