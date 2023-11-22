//
//  MapView.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 18/11/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    private let locationManager = CLLocationManager()
    @Binding var userCoordinate: CLLocationCoordinate2D?

    init(userCoordinate: Binding<CLLocationCoordinate2D?>) {
        _userCoordinate = userCoordinate
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator

        // Request When in Use authorization
        locationManager.requestWhenInUseAuthorization()

        // Start updating location
        locationManager.delegate = context.coordinator
        locationManager.startUpdatingLocation()

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view if needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, CLLocationManagerDelegate, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        // Handle location authorization changes
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedWhenInUse:
                parent.enableLocationFeatures()

            case .restricted, .denied:
                parent.disableLocationFeatures()

            case .notDetermined:
                manager.requestWhenInUseAuthorization()

            default:
                break
            }
        }

        // Update userCoordinate when the location is updated
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last?.coordinate {
                parent.userCoordinate = location
            }
        }

        // Handle selection of a location pin
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // Handle pin selection if needed
        }
    }

    func enableLocationFeatures() {
        // Code to enable location-dependent features
        print("Location features enabled!")
    }

    func disableLocationFeatures() {
        // Code to disable location-dependent features
        print("Location features disabled!")
    }
}

