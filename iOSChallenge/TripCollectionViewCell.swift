//
//  TripCollectionViewCell.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/30/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

protocol TripCollectionViewCellDelegate {
    func beganEditingTextView(tripCollectionViewCell: TripCollectionViewCell)
    func finishedEditingTextView(tripCollectionViewCell: TripCollectionViewCell)
}

class TripCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    @IBOutlet weak var momentImageView : UIImageView?
    @IBOutlet weak var momentTextView: UITextView?
    
    var delegate: TripCollectionViewCellDelegate?
    var momentIndex: Int?
    var tripIndex: Int?

    
    func textViewDidBeginEditing(textView: UITextView) {
        //Keyboard becomes visible
        //TODO: - find way to replace -215 + 50 magic with the actual height of the keyboard
        self.delegate?.beganEditingTextView(self)
        
        
        //resize superviews


        //TODO: - move textView bottom to the top of the keyboard
    }
    
    func textViewDidChange(textView: UITextView) {
        textView.scrollRangeToVisible(NSRange(location: textView.text.characters.count - 1, length: 1))
    }
    
    func stopEditing()
    {
        self.momentTextView?.endEditing(true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "/n"{
        textView.frame =  CGRectMake(textView.frame.origin.x, 0, textView.frame.width, textView.frame.height)
        return false
        }
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        //keyboard will hide
        //TODO: - find way to replace -215 + 50 magic with the actual height of the keyboard
        self.delegate?.finishedEditingTextView(self)
        //let tripViewController = delegate as! TripViewController
        /*self.superview?.superview!.frame = CGRectMake((self.superview?.superview!.frame.origin.x)!,
            (self.superview?.superview!.frame.origin.y)!,
            (self.superview?.superview!.frame.size.width)!,
            (self.superview?.superview!.frame.size.height)! + tripViewController.keyboardSize!.height) //resize*/
        
        //TODO: - move textView bottom to bottom of the screen
        //textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, <#T##width: CGFloat##CGFloat#>, <#T##height: CGFloat##CGFloat#>)
        if let index: Int = momentIndex {

            trips[tripIndex!].moments[index].journalLog = textView.text
        }
    }
}
