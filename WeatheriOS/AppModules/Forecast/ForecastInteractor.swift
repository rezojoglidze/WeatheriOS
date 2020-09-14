//
//  ForecastInteractor.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ForecastInteractor Class
final class ForecastInteractor: Interactor {
}

// MARK: - ForecastInteractor API
extension ForecastInteractor: ForecastInteractorApi {
    func getWeatherForecast() {
        BaseAPI.shared.getWeatherForecast(city: "Tbilisi"){[weak self] response in
            switch response {
            case .success(let forecast):
                self?.presenter.forecastDidLoad(forecast: forecast)
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
