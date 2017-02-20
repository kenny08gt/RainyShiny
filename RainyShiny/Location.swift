//
//  Location.swift
//  RainyShiny
//
//  Created by LionMane Software on 2/20/17.
//  Copyright © 2017 LionMane Software. All rights reserved.
//

import CoreLocation

class Location{
    
    static var sharedInstance = Location()
    
    private init(){}
    
    var longitude: Double!
    var latitude: Double!
    
}
