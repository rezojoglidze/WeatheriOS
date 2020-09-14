//
//  MainRouter.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainRouter class
final class MainRouter: Router {
}

// MARK: - MainRouter API
extension MainRouter: MainRouterApi {
}

// MARK: - Main Viper Components
private extension MainRouter {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
