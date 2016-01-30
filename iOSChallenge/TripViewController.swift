//
//  TripViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var TripImageOne: UIImageView!
    @IBOutlet weak var TripName: UILabel!
    
    var TripIndex: Int? {
        didSet{
            self.configureView()
        }
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
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextView.delegate = self

        let photoTapped = UITapGestureRecognizer(target: self, action: "photosTapped:")
        photoTapped.delegate = self
        
        
        
        self.configureView()
    }
    
    func textViewDidChange(textView: UITextView) {
        trips[TripIndex!].tripDescription = TextView.text
    }
    

    func photosTapped(sender: UITapGestureRecognizer? = nil) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
