//
//  CurrentWeather.swift
//  RainyShiny
//
//  Created by LionMane Software on 2/17/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String{
      
            if _cityName == nil{
                return ""
            }
            return _cityName
     
    }
    
    var date: String{
       
            if _date == nil{
                _date = ""
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            _date = "Today \(currentDate)"
            return _date
        
    }
    
    var weatherType: String{
       
            if _weatherType == nil{
                return ""
            }
            return _weatherType
       
    }
    
    var currenTemp: Double{
    
            if _currentTemp == nil{
                return 0.0
            }
            
            return _currentTemp
        
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
//        let currentWeatherUrl = URL(string: CURRENT_URL)
        Alamofire.request(CURRENT_URL).responseJSON{ response in
            let result = response.result
//            print(response)
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let temperature = main["temp"] as? Double{
                        // convert to celcius
                        self._currentTemp =  Double(round(10 * (temperature - 273.15)/10))
                    }
                }
            }
            completed()
        }
        
    }
    
}
