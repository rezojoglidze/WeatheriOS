//
//  MainModuleApi.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Viperit

//MARK: - MainRouter API
protocol MainRouterApi: RouterProtocol {
}

//MARK: - MainView API
protocol MainViewApi: UserInterfaceProtocol {
    func startLoading()
    func updateView(with weather: CurrentWeather)
}

//MARK: - MainPresenter API
protocol MainPresenterApi: PresenterProtocol {
    
    //Interactor -> Presenter
    func weatherDidLoaded(with weather: CurrentWeather)
}

//MARK: - MainInteractor API
protocol MainInteractorApi: InteractorProtocol {
    func getCurrentWeather()
}
