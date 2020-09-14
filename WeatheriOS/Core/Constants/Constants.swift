//
//  Constants.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation

struct Constants {
    struct Key {
        static let apiKey = "92656ead9d9666063eec9f87094f6acb"
    }

    struct Api {
        static let baseUrl = "https://api.openweathermap.org"
        
        struct Routes {
            static let api = "/api"
            static let number = "/2.5"
            static let data = "/data"
            static let weather = "/weather"
            static let forecast = "/forecast"
        }
    }
}
