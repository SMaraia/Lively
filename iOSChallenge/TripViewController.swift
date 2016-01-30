//
//  TripViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var TripName: UILabel!
    
    
    var TripIndex: Int? {
        didSet{
            //self.configureView()
        }
    }
    
    /*func configureView() {
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
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips[TripIndex!].moments.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("momentCell", forIndexPath: indexPath) as! TripCollectionViewCell
        let moment = trips[TripIndex!].moments[indexPath.row]
        // Configure the cell...
        cell.momentImageView?.image = moment.image
        cell.momentTextView?.text = moment.journalLog
        
        cell.momentTextView?.delegate = self
        
        return cell

    }
    

    func photosTapped(sender: UITapGestureRecognizer? = nil) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
