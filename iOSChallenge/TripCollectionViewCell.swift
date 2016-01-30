//
//  TripCollectionViewCell.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/30/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell, UITextViewDelegate {
    @IBOutlet weak var momentImageView : UIImageView?
    @IBOutlet weak var momentTextView: UITextView?
    
    var momentIndex: Int?
    var tripIndex: Int?
    
    func textViewDidEndEditing(textView: UITextView) {
        if let index: Int = momentIndex {
            trips[tripIndex!].moments[index].journalLog = textView.text
        }
    }
}
