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
        //UINavigationBar.appearance().barTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()//UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0, green: 0, blue: 255, alpha: 1)]
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
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

