//
//  TripViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    var trip: Trip?
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var TripImageOne: UIImageView!
    @IBOutlet weak var TripImageTwo: UIImageView!
    @IBOutlet weak var TripName: UILabel!
    
    func configureView() {
        if let tripUnwrap: Trip = self.trip {
            TripName.text = tripUnwrap.name
            if tripUnwrap.tripDescription != "" {
                TextView.text = tripUnwrap.tripDescription
            } else {
                TextView.text = "Fill in your Thoughts Here!"
            }
            if tripUnwrap.tripPhotos.count > 0 {
                TripImageOne.image = tripUnwrap.tripPhotos[0]
            } else {
                TripImageOne.tintColor = UIColor.blackColor()
            }
            
            if tripUnwrap.tripPhotos.count > 1 {
                TripImageTwo.image = tripUnwrap.tripPhotos[1]
            } else {
                TripImageTwo.tintColor = UIColor.blackColor()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
