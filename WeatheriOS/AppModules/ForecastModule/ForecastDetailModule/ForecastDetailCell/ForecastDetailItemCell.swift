//
//  ForecastDetailItemCell.swift
//  WeatheriOS
//
//  Created by Rezo Joglidze on 9/15/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import UIKit

class ForecastDetailItemCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var celsiusLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: View Setup
    func loadWeatherIcon(iconId: String) {
        weatherIcon.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(iconId)@2x.png"))
    }
    
    func configureDate(date: String) -> String{
        print("miwodebulia -> \(date)")
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:date)!
        print("date -> \(date)")
        dateFormatter.dateFormat = "hh:mm"
        print(dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
    }
    
    func configure(forecastDetail: List){
        loadWeatherIcon(iconId: forecastDetail.weather[0].icon)
        infoLbl.text = forecastDetail.weather[0].main
        dateLbl.text = forecastDetail.dt_txt
        celsiusLbl.text = String(Int(forecastDetail.main.temp)) + "C"
    }
}
