//
//  TripViewController.swift
//  Lively
//
//  Created by Sean Maraia on 1/31/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    
    @IBOutlet weak var tripLabel: UILabel!
    @IBOutlet weak var tripImage: UIImageView!
    var tripIndex: Int?
    var trip: Trip?
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        trip = trips[tripIndex!]
        var images : [UIImage] = []
        for moment in (trip?.moments)! {
            images.append(moment.image)
        }
        tripImage.animationImages = images
        tripImage.animationDuration = Double(images.count) * 8.0
        tripImage.startAnimating()
        
        tripLabel.text = trip?.moments[currentIndex].journalLog
        
        let timer = NSTimer(timeInterval: 8.0, target: self, selector: "updateLabel:", userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
    }
    
    func updateLabel(sender: AnyObject?) {
        currentIndex = (currentIndex + 1) % (trip?.moments.count)!
        tripLabel.text = trip?.moments[currentIndex].journalLog
    }
}
