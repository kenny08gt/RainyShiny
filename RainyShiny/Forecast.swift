//
//  Forecast.swift
//  RainyShiny
//
//  Created by LionMane Software on 2/17/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    

    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String{
        if _weatherType == nil{
            return ""
        }
        return _weatherType
    }
    
    var highTemp: String{
        if _highTemp == nil{
            return ""
        }
        return _highTemp
    }
    var lowTemp: String{
        if _lowTemp == nil{
            return ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String,AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let min = temp["min"] as? Double{
                self._lowTemp = "\(round(10 * (min - 273.15)/10))"
            }
            if let max = temp["max"] as? Double{
                self._highTemp = "\(round(10 * (max - 273.15)/10))"
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let dt = weatherDict["dt"] as? Double{
            let unixConvertDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            
//            var currentDate = dateFormatter.string(from:unixConvertDate)
//            currentDate = dateFormatter.string(from: currentDate)
            self._date = unixConvertDate.dayOfTheWeek()
            print(self._date)
        }
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
}

extension Date{
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
