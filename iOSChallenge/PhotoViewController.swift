//
//  ViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/28/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var photoCollection: UICollectionView?
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowLayout?.itemSize = CGSize(width: self.view.frame.width / 3, height: self.view.frame.width / 3)
        for image in trips.trips{
            
        }
        //photoCollection?.collectionViewLayout.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

