//
//  TripViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/29/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, TripCollectionViewCellDelegate {
    @IBOutlet weak var TripName: UILabel!
    
    @IBOutlet weak var momentCollectionView: UICollectionView!
    
    var addButton : UIBarButtonItem?

    var keyboardSize: CGRect?
    @IBOutlet weak var containingViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var containingViewTopConstraint: NSLayoutConstraint!
    
    var tripIndex: Int? {
        didSet{
            //self.configureView()
        }
    }
    
    /*func configureView() {
        if TextView != nil {
            if let index: Int = tripIndex {
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
    @IBAction func addMoment(sender: AnyObject) {
    
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.allowsEditing = true
        
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)

        
    }
    

    
    func keyboardWasShown(notification: NSNotification){
        var userInfo : Dictionary = notification.userInfo!
        keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        UIView.animateWithDuration(duration, animations: {
            self.containingViewBottomConstraint.constant = (self.keyboardSize?.height)!
            self.containingViewTopConstraint.constant = -(self.keyboardSize?.height)!
            self.view.layoutIfNeeded()
        })
        
        
        
    }
    
    func keyboardWasHidden(notification: NSNotification){
        var userInfo : Dictionary = notification.userInfo!
        let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        UIView.animateWithDuration(duration, animations: {
        self.containingViewBottomConstraint.constant = 0
        self.containingViewTopConstraint.constant = 0
        self.view.layoutIfNeeded()
    })
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        let newMoment = Moment(index: trips[tripIndex!].moments.count)
        newMoment.image = image
        newMoment.journalLog = ""
        trips[tripIndex!].moments.append(newMoment)
        self.dismissViewControllerAnimated(true, completion: nil)
        momentCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        momentCollectionView.delegate = self
        momentCollectionView.dataSource = self
        addButton = navigationItem.rightBarButtonItem!
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasHidden:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips[tripIndex!].moments.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("momentCell", forIndexPath: indexPath) as! TripCollectionViewCell
        let moment = trips[tripIndex!].moments[indexPath.row]
        // Configure the cell...
        cell.momentImageView?.image = moment.image
        
        cell.momentTextView?.text = moment.journalLog
        
        cell.delegate = self
        cell.momentTextView?.delegate = cell
        
        cell.momentIndex = indexPath.row
        cell.tripIndex = tripIndex!
        
        return cell

    }
    

    func beganEditingTextView(tripCollectionViewCell: TripCollectionViewCell) {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: tripCollectionViewCell, action: "stopEditing")
        navigationItem.rightBarButtonItem = doneButton
        momentCollectionView.scrollEnabled = false
        
    }
    
    func finishedEditingTextView(tripCollectionViewCell: TripCollectionViewCell) {
        navigationItem.rightBarButtonItem = addButton
        momentCollectionView.scrollEnabled = true
        
    }
    
    func photosTapped(sender: UITapGestureRecognizer? = nil) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
