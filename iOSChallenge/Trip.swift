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
    var tripPhotos: [UIImage]
    var tripDescription: String
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(tripPhotos, forKey: "PHOTOS")
        aCoder.encodeObject(name, forKey: "NAME")
        aCoder.encodeObject(tripDescription, forKey: "DESC")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("NAME") as! String
        self.tripPhotos = aDecoder.decodeObjectForKey("PHOTOS") as! [UIImage]
        self.tripDescription = aDecoder.decodeObjectForKey("DESC") as! String
        super.init()
    }
    
    init(name: String) {
        self.name = name
        self.tripPhotos = []
        self.tripDescription = ""
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