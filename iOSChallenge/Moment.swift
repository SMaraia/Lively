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
    var index: Int32
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(image, forKey: "MOMENT_PHOTO")
        aCoder.encodeObject(journalLog, forKey: "MOMENT_DESC")
        aCoder.encodeInt(index, forKey: "MOMENT_INDEX")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.image = aDecoder.decodeObjectForKey("MOMENT_PHOTOS") as! UIImage
        self.journalLog = aDecoder.decodeObjectForKey("MOMENT_DESC") as! String
        self.index = aDecoder.decodeIntForKey("MOMENT_INDEX")
        super.init()
    }
    
    init(index: Int32) {
        self.index = index
        self.image = UIImage()
        self.journalLog = ""
    }

    
}