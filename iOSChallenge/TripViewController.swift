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
    
    @IBOutlet var locationButton: UIButton!
    
    @IBAction func addLocation(sender: AnyObject) {
        let alertView = UIAlertController(title: "Name of Trip", message: "", preferredStyle: .Alert)
        alertView.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "Aruba"
        }
        let saveAction = UIAlertAction(title: "Done", style: .Default, handler: {alert -> Void in
            let tripLoc = "@" + alertView.textFields![0].text!
            if tripLoc != "@" {
                self.locationButton.setTitle(tripLoc, forState: UIControlState.Normal)
                
            }
            
        })
        alertView.addAction(saveAction)
        self.presentViewController(alertView, animated: true, completion: nil)
        
    }

    var tripIndex: Int? {
        didSet{
            //self.configureView()
        }
    }
    
    @IBAction func addMoment(sender: AnyObject) {
    
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.allowsEditing = false
        
        
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
        if let index = tripIndex{
            TripName.text = trips[index].name
        }
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasHidden:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
        self.navigationController?.navigationBar.translucent = true
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
        
        /*if !UIAccessibilityIsReduceTransparencyEnabled() {
            cell.backgroundColor = UIColor.clearColor()
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = cell.frame
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.view.insertSubview(blurEffectView, aboveSubview: cell)
        } 
        else {
            cell.backgroundColor = UIColor.blackColor()
        }*/
        
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
    
    func photoTapped(sender: UITapGestureRecognizer? = nil) {
        //let segue = UIStoryboardSegue(identifier: "photoFullScreen", source: self, destination: PhotoViewController)
        //prepareForSegue(segue, sender: self)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "photoFullScreen" {
            if let indexPath = momentCollectionView.indexPathForCell(sender as! TripCollectionViewCell) {
                (segue.destinationViewController as! PhotoViewController).imageSelected = trips[tripIndex!].moments[indexPath.row].image
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
