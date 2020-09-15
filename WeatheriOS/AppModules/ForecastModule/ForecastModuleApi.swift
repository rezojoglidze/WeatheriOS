//
//  ForecastModuleApi.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Viperit

//MARK: - ForecastRouter API
protocol ForecastRouterApi: RouterProtocol {
}

//MARK: - ForecastView API
protocol ForecastViewApi: UserInterfaceProtocol {
    func startLoading()
    func updateView(forecastDetails: [ForecastDetails])
}

//MARK: - ForecastPresenter API
protocol ForecastPresenterApi: PresenterProtocol {
    
    //Interactor -> Presenter
    func forecastDetailsDidLoad(forecastDetails: [ForecastDetails])
}

//MARK: - ForecastInteractor API
protocol ForecastInteractorApi: InteractorProtocol {
    func getWeatherForecast()
}
