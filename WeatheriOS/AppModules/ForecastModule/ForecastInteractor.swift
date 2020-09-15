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
    
    var ForecastDetailItems: [ForecastDetails] = []
    
    func makeArrayForForecastDetail(forecast: Forecast) {
     
        
        
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                let date = dateFormatter.date(from:forecast.list[0].dt_txt)!
        
        
        dateFormatter.dateFormat = "HH"
      
        
        let firstItemCountOfForecastDetailItems = ( 24 - Int(dateFormatter.string(from: date))!) / 3
        
        

        let firstItemElements = Array(forecast.list.prefix(firstItemCountOfForecastDetailItems))
        ForecastDetailItems.append(ForecastDetails(day: "ოთხშ", forecastDetail: firstItemElements))


        let secondItemElements = Array( forecast.list[firstItemCountOfForecastDetailItems...firstItemCountOfForecastDetailItems+8]) // also works
        ForecastDetailItems.append(ForecastDetails(day: "ხუთშ", forecastDetail: secondItemElements))

       let thirdItemElements = Array( forecast.list[firstItemCountOfForecastDetailItems+8...firstItemCountOfForecastDetailItems+16]) // also works
             ForecastDetailItems.append(ForecastDetails(day: "პარ", forecastDetail: thirdItemElements))


        let fourthItemElements = Array( forecast.list[firstItemCountOfForecastDetailItems+16...firstItemCountOfForecastDetailItems+24]) // also works
              ForecastDetailItems.append(ForecastDetails(day: "შაბ", forecastDetail: fourthItemElements))


        let fifthItemElements = Array( forecast.list[firstItemCountOfForecastDetailItems+24...firstItemCountOfForecastDetailItems+32]) // also works
              ForecastDetailItems.append(ForecastDetails(day: "კვირ", forecastDetail: fifthItemElements))


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
