//
//  Quake+MKAnnotation.swift
//  Quakes
//
//  Created by Wyatt Harrell on 5/7/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation
import MapKit

extension Quake: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var title: String? {
        place
    }
    
    var subtitle: String? {
        if let magnitude = magnitude {
            return "Magnitude: \(magnitude)"
        } else {
            return "Magnitude: N/A"
        }
    }
}
