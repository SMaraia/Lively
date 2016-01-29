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
    
    var detailItem: AnyObject? {
        didSet{
            self.configureView()
        }
    }
    
    func configureView() {
        if TextView != nil {
            if let detail: Trip = self.detailItem as? Trip {
                
                TripName.text = detail.name
                if detail.tripDescription != "" {
                    TextView.text = detail.tripDescription
                } else {
                    TextView.text = "Fill in your Thoughts Here!"
                }
                if detail.tripPhotos.count > 0 {
                    TripImageOne.image = detail.tripPhotos[0]
                } else {
                    TripImageOne.tintColor = UIColor.blackColor()
                }
                
                if detail.tripPhotos.count > 1 {
                    TripImageTwo.image = detail.tripPhotos[1]
                } else {
                    TripImageTwo.tintColor = UIColor.blackColor()
                }
                
                trip = detail
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
