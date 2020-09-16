//
//  ForecastInteractor.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

struct ForecastDetails {
    let day: String
    let forecastDetail: [List]
}

// MARK: - ForecastInteractor Class
final class ForecastInteractor: Interactor {
    
    let formatter = DateFormatter()
    let weekDays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    var ForecastDetailItems: [ForecastDetails] = []
    var relevantWeekDays: [String] = []
    
    func getCurrentHour(date: String) -> Int {
        let currentHour = Int(Date().configureDateByFormatType(date: date, inputDateformatType: "yyyy-MM-dd HH:mm:ss", returnValueFormatType: "HH"))!
        let day = Date().getCurrentDateByFormatType(with: "EEE")
        
        if let index = weekDays.firstIndex(of: day) {
            getRelevantWeekDay(index: index)
        }
        
        return currentHour
    }
    
    func getRelevantWeekDay(index: Int) {
        
        //tu index metia 2-ze, weekDays-dan ar shegvidzlia index-is shemdgomi 5 elementis ageba.
        if index > 2 {
            let firstPartCount = (weekDays.count - 1) - index
            let secondPartCount = 5 - firstPartCount
            
            for weekDay in weekDays[index..<(index+firstPartCount)] {
                relevantWeekDays.append(weekDay)
            }
            for weekDay in weekDays[0..<secondPartCount] {
                relevantWeekDays.append(weekDay)
            }
        } else {
            for weekDay in weekDays[index..<(index+5)] {
                relevantWeekDays.append(weekDay)
            }
        }
    }
    
    
    func makeArrayForForecastDetail(forecast: Forecast) {
        let currentHour = getCurrentHour(date: forecast.list[0].dt_txt)
        let forecastDetailItemsFirstItemCount = (24 - currentHour) / 3
        
        
        let firstItemElements = Array(forecast.list.prefix(forecastDetailItemsFirstItemCount))
        ForecastDetailItems.append(ForecastDetails(day: relevantWeekDays[0], forecastDetail: firstItemElements))
        
        let secondItemElements = Array(forecast.list[forecastDetailItemsFirstItemCount...forecastDetailItemsFirstItemCount + 7])
        ForecastDetailItems.append(ForecastDetails(day: relevantWeekDays[1], forecastDetail: secondItemElements))
        
        let thirdItemElements = Array(forecast.list[forecastDetailItemsFirstItemCount + 8...forecastDetailItemsFirstItemCount + 15])
        ForecastDetailItems.append(ForecastDetails(day: relevantWeekDays[2], forecastDetail: thirdItemElements))
        
        let fourthItemElements = Array(forecast.list[forecastDetailItemsFirstItemCount + 16...forecastDetailItemsFirstItemCount + 23])
        ForecastDetailItems.append(ForecastDetails(day: relevantWeekDays[3], forecastDetail: fourthItemElements))
        
        let fifthItemElements = Array(forecast.list[forecastDetailItemsFirstItemCount + 24...forecastDetailItemsFirstItemCount + 31])
        ForecastDetailItems.append(ForecastDetails(day: relevantWeekDays[4], forecastDetail: fifthItemElements))
        
        
        presenter.forecastDetailsDidLoad(forecastDetails: ForecastDetailItems)
    }
}

// MARK: - ForecastInteractor API
extension ForecastInteractor: ForecastInteractorApi {
    func getWeatherForecast() {
        BaseAPI.shared.getWeatherForecast(city: "Tbilisi"){[weak self] response in
            switch response {
            case .success(let forecast):
                self?.makeArrayForForecastDetail(forecast: forecast)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension ForecastInteractor {
    var presenter: ForecastPresenterApi {
        return _presenter as! ForecastPresenterApi
    }
}
