//
//  MainPresenter.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainPresenter Class
final class MainPresenter: Presenter {
    
    override func viewHasLoaded() {
        view.startLoading()
        interactor.getCurrentWeather()
    }
}

// MARK: - MainPresenter API
extension MainPresenter: MainPresenterApi {
    func weatherDidLoaded(with weather: CurrentWeather) {
        view.updateView(with: weather)
    }
}

// MARK: - Main Viper Components
private extension MainPresenter {
    var view: MainViewApi {
        return _view as! MainViewApi
    }
    var interactor: MainInteractorApi {
        return _interactor as! MainInteractorApi
    }
    var router: MainRouterApi {
        return _router as! MainRouterApi
    }
}
