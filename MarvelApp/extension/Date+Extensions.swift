//
//  Date+Extensions.swift
//  MarvelApp
//
//  Created by KasimOzdemir on 8.10.2021.
//

import Foundation

extension Date {
    var currentTimeStamp: String{
        return "\(Int64(self.timeIntervalSince1970 * 1000))"
    }
    
    func toString(format : String = "'2005-01-01,'yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
