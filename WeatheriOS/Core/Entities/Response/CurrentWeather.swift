//
//  currentWeather.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let base: String
    let clouds: Clouds
    let cod: Int
    let coord: Coord
    let dt: Int
    let id: Int
    let main: Main
    let name: String
    let sys: Sys
    let timezone: Int
    let visibility: Int
    let weather: [Weather]
    let wind: Wind
}

struct Clouds: Codable {
    let all: Int
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}

struct Main: Codable {
    let feels_like: Double
    let humidity: Double
    let pressure: Double
    let temp: Double
    let temp_max: Double
    let temp_min: Double
}

struct Sys: Codable {
    let country: String
    let id: Int
    let sunrise: Int
    let sunset: Int
    let type: Int
}


struct Weather: Codable {
    let description: String
    let icon: String
    let id: Int
    let main: String
}

struct Wind: Codable {
    let deg: Int
    let speed: Double
}
