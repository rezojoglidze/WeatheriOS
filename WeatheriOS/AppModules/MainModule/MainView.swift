
//
//  MainView.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/14/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit
import Viperit
import Kingfisher

//MARK: MainView Class
final class MainView: HomeViewController {
        
    //MARK: Class Variable
    let formatter = DateFormatter()
    
    //MARK: IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateTimeLbl: UILabel!
    @IBOutlet weak var amOrPmLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var weatherDescriptionLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var cloudinessPercentageLbl: UILabel!
    @IBOutlet weak var rainDropsLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var directionLbl: UILabel!
    
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: View Setup
    func loadWeatherIcon(iconId: String) {
        weatherIcon.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(iconId)@2x.png"))
    }
    
    func setupView() {
        [dateView,contentView].forEach {
            $0?.isHidden = false
            $0?.layer.cornerRadius = $0 == dateView ? 18 : 25
        }
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 5
    }
    
    func configureDateView(with labelsWithDateFormatType: [(String, UILabel?)]) {
        
        labelsWithDateFormatType.forEach { (formatType, label) in
            formatter.dateFormat = formatType
            label!.text = formatter.string(from: Date())
        }
    }
    
    func configureContentView(with currentWeather: CurrentWeather) {
        loadWeatherIcon(iconId: currentWeather.weather[0].icon)
        cityLbl.text = currentWeather.name + ", " + currentWeather.sys.country
        weatherDescriptionLbl.text = String(Int(currentWeather.main.temp)) + "C| " + currentWeather.weather[0].main
        cloudinessPercentageLbl.text = String(currentWeather.clouds.all) + "%"
        windSpeedLbl.text = String(currentWeather.wind.speed) + "KM/H"
        
        let labelsWithDateFormatType = [("hh:mm",dateTimeLbl),("a",amOrPmLbl),("dd MMM yyyy",dateLbl),("EEEE",dayLbl)]
        configureDateView(with: labelsWithDateFormatType)
        
        setupView()
    }
}

//MARK: - MainView API
extension MainView: MainViewApi {
    func updateView(with weather: CurrentWeather) {
        self.stopLoading()
        self.configureContentView(with: weather)
    }
}

// MARK: - MainView Viper Components API
private extension MainView {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
    var displayData: MainDisplayData {
        return _displayData as! MainDisplayData
    }
}
