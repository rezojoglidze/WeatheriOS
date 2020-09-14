//
//  MainInteractor.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainInteractor Class
final class MainInteractor: Interactor {
}

// MARK: - MainInteractor API
extension MainInteractor: MainInteractorApi {
    func getCurrentWeather() {
        BaseAPI.shared.getCurrentWeather(city: "Tbilisi") { [weak self] (response) in
            switch response {
            case .success(let currentWeather):
                self?.presenter.weatherDidLoaded(with: currentWeather)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension MainInteractor {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
