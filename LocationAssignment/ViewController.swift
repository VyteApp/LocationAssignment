//
//  ViewController.swift
//  LocationAssignment
//
//  Created by Marcos Alberto Pertierra Arrojo on 3/30/15.
//  Copyright (c) 2015 Vyte. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mainLabel : UILabel!
    @IBOutlet var startLoggingButton : UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startLoggingButtonTapped(sender : AnyObject){
        //TODO: Log location(lat/long) and accuracy data to file
        
        //let documentDirectoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first! as NSURL
        //let randFile = "log"+String(Int(arc4random_uniform(7)))+".txt"
        //let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent(randFile)
        //let currentLocation = mapView.userLocation.location
        //TODO: Need accuracy value
        //let locationData = currentLocation.description
        //locationData.writeToURL(fileDestinationUrl, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
    }
    
    func zoomIn() {
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.location.coordinate, 50, 50)
        
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation
        userLocation: MKUserLocation!) {
            zoomIn()
            //mapView.centerCoordinate = userLocation.location.coordinate
    }
    

}

