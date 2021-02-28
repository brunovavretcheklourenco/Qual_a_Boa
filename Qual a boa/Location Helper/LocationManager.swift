//
//  LocationManager.swift
//  Qual a boa
//
//  Created by Bruno Vavretchek Lourenco on 23/02/21.
//  Copyright © 2021 Bruno Vavretchek Lourenco. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            self.locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        default:
            self.locationManager.stopUpdatingLocation()
        }
    }
}
