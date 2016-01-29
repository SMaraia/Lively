//
//  TripViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITextViewDelegate{
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var TripImageOne: UIImageView!
    @IBOutlet weak var TripImageTwo: UIImageView!
    @IBOutlet weak var TripName: UILabel!
    
    var TripIndex: Int? {
        didSet{
            self.configureView()
        }
    }
    
    @IBAction func exit(sender: AnyObject) {
        self
    }
    func configureView() {
        if TextView != nil {
            if let index: Int = TripIndex {
                TripName.text = trips[index].name
                if trips[index].tripDescription != "" {
                    TextView.text = trips[index].tripDescription
                } else {
                    TextView.text = "Fill in your Thoughts Here!"
                }
                if trips[index].tripPhotos.count > 0 {
                    TripImageOne.image = trips[index].tripPhotos[0]
                } else {
                    TripImageOne.tintColor = UIColor.blackColor()
                }
                
                if trips[index].tripPhotos.count > 1 {
                    TripImageTwo.image = trips[index].tripPhotos[1]
                } else {
                    TripImageTwo.tintColor = UIColor.blackColor()
                }
            }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.delegate = self

        self.configureView()
    }
    
    func textViewDidChange(textView: UITextView) {
        trips[TripIndex!].tripDescription = TextView.text
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
