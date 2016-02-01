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
    
    var dropPin: MKPointAnnotation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showsBuildings = true
        mapView.mapType = MKMapType.SatelliteFlyover
        let tripLocPin = trips[tripIndex!].locData?.coordinate
        dropPin = MKPointAnnotation()
        dropPin!.coordinate = tripLocPin!
        dropPin!.title = trips[tripIndex!].name + " at " + trips[tripIndex!].location
        mapView.addAnnotation(dropPin!)
        
        //let zoomRect = MKMapRectMake((dropPin?.coordinate.latitude)! - 0.05, (dropPin?.coordinate.longitude)! - 0.05, 0.1, 0.1)
        
        //mapView.setVisibleMapRect(zoomRect, animated: true)
        self.mapView.showAnnotations([dropPin!], animated: true)
    }
    
    @IBOutlet var mapView: MKMapView!
    
    var tripIndex: Int?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        if annotation.title! == dropPin?.title {
            let pinView = MKPinAnnotationView()
            pinView.pinTintColor = UIColor.purpleColor()
            pinView.canShowCallout = true
            return pinView
        }
        
        return nil
    }

}
