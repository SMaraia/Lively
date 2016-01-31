//
//  Trip.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/28/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import Foundation
import UIKit

class Trip: NSObject, NSCoding {
    var name: String
    var location: String
    var isLocationSet: Bool
    var moments: [Moment]
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(moments, forKey: "TRIP_MOMENTS")
        aCoder.encodeObject(name, forKey: "TRIP_NAME")
        aCoder.encodeObject(location, forKey: "TRIP_LOCATION")
        aCoder.encodeObject(isLocationSet, forKey: "IS_TRIP_SET")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("TRIP_NAME") as! String
        self.location = aDecoder.decodeObjectForKey("TRIP_LOCATION") as! String
        self.moments = aDecoder.decodeObjectForKey("TRIP_MOMENTS") as! [Moment]
        self.isLocationSet = aDecoder.decodeObjectForKey("IS_TRIP_SET") as! Bool
        super.init()
    }
    
    init(name: String) {
        self.name = name
        self.location = "Add Location"
        self.isLocationSet = false
        self.moments = []
    }
}

class TripHolder: NSObject, NSCoding {
    var trips : [Trip]
    override init() {
        self.trips = []
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(trips, forKey: "TRIPS")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.trips = aDecoder.decodeObjectForKey("TRIPS") as! [Trip]
    }
    
    var count: Int {
        return self.trips.count
    }
    
    subscript(index: Int) -> Trip {
        get{
            return self.trips[index]
        }
        
        set{
            self.trips[index] = newValue
        }
        
    }
    
    func addTrip(trip: Trip) {
        trips.append(trip)
    }
}

var trips = TripHolder()