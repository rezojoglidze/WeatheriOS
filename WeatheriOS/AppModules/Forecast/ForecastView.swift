//
//  ForecastView.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit

//MARK: ForecastView Class
final class ForecastView: HomeViewController {
    //MARK: class Variables
    
    //MARK: IBOutlets
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: - ForecastView API
extension ForecastView: ForecastViewApi {
    func updateView(forecast: Forecast) {
        self.stopLoading()
//        print(forecast)
    }
}

// MARK: - ForecastView Viper Components API
private extension ForecastView {
    var presenter: ForecastPresenterApi {
        return _presenter as! ForecastPresenterApi
    }
    var displayData: ForecastDisplayData {
        return _displayData as! ForecastDisplayData
    }
}
