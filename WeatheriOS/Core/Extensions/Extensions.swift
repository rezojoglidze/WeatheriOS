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
    func currentFiveDay() -> [String] {
        
        var currentFiveDay:[String] = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        
        let calendar: NSCalendar = NSCalendar.current as NSCalendar
        let components: NSDateComponents = calendar.components(.weekday, from: self) as NSDateComponents
        
        let index = weekdays.firstIndex(of: weekdays[components.weekday - 1])!
        
        if ((weekdays.count) - index) < 2 {
            let counter = (weekdays.count - 1) - index
            print(counter)
        } else {
            while index < (index + 3) {
                currentFiveDay.append(weekdays[index])
            }
        }
        
        return currentFiveDay
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
