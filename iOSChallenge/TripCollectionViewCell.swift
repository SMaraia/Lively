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
        self.delegate?.beganEditingTextView(self)
        self.superview?.superview!.frame = CGRectMake((self.superview?.superview!.frame.origin.x)!,
            (self.superview?.superview!.frame.origin.y)!,
            (self.superview?.superview!.frame.size.width)!,
            (self.superview?.superview!.frame.size.height)! - 215 + 50)   //resize
    }
    
    func textViewDidChange(textView: UITextView) {
        textView.scrollRangeToVisible(NSRange(location: textView.text.characters.count - 1, length: 1))
    }
    
    func stopEditing()
    {
        self.momentTextView?.endEditing(true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        //keyboard will hide
        self.delegate?.finishedEditingTextView(self)
        self.superview?.superview!.frame = CGRectMake((self.superview?.superview!.frame.origin.x)!,
            (self.superview?.superview!.frame.origin.y)!,
            (self.superview?.superview!.frame.size.width)!,
            (self.superview?.superview!.frame.size.height)! + 215 - 50) //resize
        
        if let index: Int = momentIndex {

            trips[tripIndex!].moments[index].journalLog = textView.text
        }
    }
}
