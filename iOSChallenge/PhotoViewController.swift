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
    
    //var backgroundImage: UIImage?
    //var shadowImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageSelected
        //self.navigationController?.navigationBar.
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.translucent = false
        //self.navigationController?.navigationBar.shadowImage = UIImage(
        //photoCollection?.collectionViewLayout.
        // Do any additional setup after loading the view, typically from a nib.
        
        //backgroundImage = self.navigationController?.navigationBar.backgroundImageForBarMetrics(UIBarMetrics.Default)
        //shadowImage = self.navigationController?.navigationBar.shadowImage
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        //self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /*override func viewDidDisappear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(backgroundImage, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = shadowImage
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

