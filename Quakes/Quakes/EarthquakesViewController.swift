//
//  EarthquakesViewController.swift
//  Quakes
//
//  Created by Paul Solt on 10/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit
import MapKit

class EarthquakesViewController: UIViewController {
		
	// NOTE: You need to import MapKit to link to MKMapView
	@IBOutlet var mapView: MKMapView!
	
    let quakeFetcher = QuakeFetcher()
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        mapView.delegate = self
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: "QuakeView")
        
        quakeFetcher.fetchQuakes { (quakes, error) in
            if let error = error {
                print("Error fetching quakes: \(error)")
            }
            
            guard let quakes = quakes else { return }
            print("Quakes: \(quakes.count)")
            
            DispatchQueue.main.async {
                self.mapView.addAnnotations(quakes)
                
                guard let quake = quakes.first else { return }
                
                let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
                let region = MKCoordinateRegion(center: quake.coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
            }
        }
	}
}

extension EarthquakesViewController: MKMapViewDelegate {
    
}
