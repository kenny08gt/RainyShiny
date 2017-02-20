//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by LionMane Software on 2/20/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
   
    func configureCell(forecast: Forecast){
        lowTemp.text = "\(forecast.lowTemp)º"
        highTemp.text = "\(forecast.highTemp)º"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
    }
    
}
