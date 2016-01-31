//
//  MapViewController.swift
//  Lively
//
//  Created by Apple on 1/31/16.
//  Copyright © 2016 Sean Maraia. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        //let tripLocPin = trips[]
    }
    
    @IBOutlet var mapView: MKMapView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    /*func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
    }*/

}
