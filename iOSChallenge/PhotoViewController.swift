//
//  ViewController.swift
//  iOSChallenge
//
//  Created by Sean Maraia on 1/28/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageSelected : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageSelected
        //photoCollection?.collectionViewLayout.
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

