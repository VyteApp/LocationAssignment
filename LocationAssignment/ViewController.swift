//
//  ViewController.swift
//  LocationAssignment
//
//  Created by Marcos Alberto Pertierra Arrojo on 3/30/15.
//  Copyright (c) 2015 Vyte. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UITextViewDelegate {

    @IBOutlet var mainLabel : UILabel!
    @IBOutlet var startLoggingButton : UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var textView: UITextView!
    var timer: dispatch_source_t!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.delegate = self
        textView.editable = false
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(MKUserTrackingMode.Follow, animated: true)
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func startTimer() {
        let queue = dispatch_queue_create("com.domain.app.timer", nil)
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC, 1 * NSEC_PER_SEC) // every 10 seconds, with leeway of 1 second
        dispatch_source_set_event_handler(timer) {
            if (self.mapView.userLocationVisible){
                dispatch_async(dispatch_get_main_queue()){
                self.textView.text.extend("\n+"+self.mapView.userLocation.location.description)
                }
            }
        }
        dispatch_resume(timer)
    }
    
    func stopTimer() {
        dispatch_source_cancel(timer)
        timer = nil
    }

    

}

