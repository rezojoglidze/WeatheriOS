//
//  ForecastRouter.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - ForecastRouter class
final class ForecastRouter: Router {
}

// MARK: - ForecastRouter API
extension ForecastRouter: ForecastRouterApi {
}

// MARK: - Forecast Viper Components
private extension ForecastRouter {
    var presenter: ForecastPresenterApi {
        return _presenter as! ForecastPresenterApi
    }
}
