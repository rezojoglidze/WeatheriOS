//
//  ForecastPresenter.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ForecastPresenter Class
final class ForecastPresenter: Presenter {
    
    override func viewHasLoaded() {
        view.startLoading()
        interactor.getWeatherForecast()
    }
}

// MARK: - ForecastPresenter API
extension ForecastPresenter: ForecastPresenterApi {
    func forecastDidLoad(forecast: Forecast) {
        view.updateView(forecast: forecast)
    }
}

// MARK: - Forecast Viper Components
private extension ForecastPresenter {
    var view: ForecastViewApi {
        return _view as! ForecastViewApi
    }
    var interactor: ForecastInteractorApi {
        return _interactor as! ForecastInteractorApi
    }
    var router: ForecastRouterApi {
        return _router as! ForecastRouterApi
    }
}
