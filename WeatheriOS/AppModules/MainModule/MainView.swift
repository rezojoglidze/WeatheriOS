
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
        weatherIcon.kf.setImage(with: URL(string: Constants.Api.imageDownloadBaseUrl + Constants.Api.Routes.img + Constants.Api.Routes.wn + "/\(iconId)" + "@2x.png"))
    }
    
    func configureAnimation() {
        UIView.animate(withDuration: 2) {
            self.dateView.frame = CGRect(x: 0, y: 0, width: self.dateView.frame.width, height: self.dateView.frame.height)
            self.dateView.center = self.view.center
        }
        weatherIcon.shake()
    }
    
    func setupView() {
        [dateView,contentView].forEach {
            $0?.isHidden = false
        }
        weatherIcon.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        weatherIcon.layer.shadowPath = UIBezierPath(rect: CGRect(x: 20,
                                                                 y: weatherIcon.bounds.maxY + 10,
                                                                 width: weatherIcon.bounds.width,
                                                                 height: 5)).cgPath
    }
    
    func configureDateView(with labelsWithDateFormatType: [(String, UILabel?)]) {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "GMT+4")
        
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
    }
}

//MARK: - MainView API
extension MainView: MainViewApi {
    func updateView(with weather: CurrentWeather) {
        self.stopLoading()
        configureContentView(with: weather)
        
        let labelsWithDateFormatType = [("hh:mm",dateTimeLbl),("a",amOrPmLbl),("dd MMM yyyy",dateLbl),("EEEE",dayLbl)]
        configureDateView(with: labelsWithDateFormatType)
        setupView()
        configureAnimation()
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
