//
//  Extensions.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/15/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import UIKit

let weekdays = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Frid",
    "Sat"
]

extension Date {
    
    func getCurrentDateByFormatType(with formatType: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "GMT+4")
        dateFormatter.dateFormat = formatType

        return dateFormatter.string(from: Date())
    }
    
    func configureDateByFormatType(date: String, inputDateformatType: String, returnValueFormatType: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "GMT+4")

        dateFormatter.dateFormat = inputDateformatType
        let date = dateFormatter.date(from:date)!
        dateFormatter.dateFormat = returnValueFormatType
        
        return dateFormatter.string(from: date)
    }
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}

extension UIFont {
    
    enum HelveticaNeueGeo: String {
        case medium = "HelveticaNeueLTGEO-65Medium"
        case roman = "HelveticaNeueLTGEO-55Roman"
        case bold = "HelveticaNeueLTGEO-75Bold"
    }
    
    static func main(type: HelveticaNeueGeo, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }
}
