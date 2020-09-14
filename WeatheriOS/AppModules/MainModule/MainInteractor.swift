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
}

// MARK: - Interactor Viper Components Api
private extension MainInteractor {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
