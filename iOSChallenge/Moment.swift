//
//  Moment.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/30/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import Foundation
import UIKit

class Moment: NSObject, NSCoding {
    
    var image: UIImage
    var journalLog: String
    var index: Int
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(image, forKey: "MOMENT_PHOTO")
        aCoder.encodeObject(journalLog, forKey: "MOMENT_DESC")
        aCoder.encodeObject(index, forKey: "MOMENT_INDEX")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.image = aDecoder.decodeObjectForKey("MOMENT_PHOTO") as! UIImage
        self.journalLog = aDecoder.decodeObjectForKey("MOMENT_DESC") as! String
        self.index = aDecoder.decodeObjectForKey("MOMENT_INDEX") as! Int
        super.init()
    }
    
    init(index: Int) {
        self.index = index
        self.image = UIImage()
        self.journalLog = ""
    }

    
}