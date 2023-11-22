//
//  Posizione.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 20/11/23.
//

import SwiftUI
import MapKit

struct Posizione: View {
   @StateObject var locationManager = LocationManager()
   @State var userTrackingMode: MapUserTrackingMode = .follow

   var body: some View {
       Map(coordinateRegion: $locationManager.region, showsUserLocation: true, userTrackingMode: $userTrackingMode)
           .onAppear {
               locationManager.requestAuthorization()
           } .ignoresSafeArea()
   }
}

class LocationManager: NSObject, ObservableObject {
   private let locationManager = CLLocationManager()
   @Published var region = MKCoordinateRegion(
       center: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964), // Coordinate di Roma
       span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
   )

   override init() {
       super.init()
       locationManager.delegate = self
       locationManager.requestWhenInUseAuthorization()
   }

   func requestAuthorization() {
       locationManager.requestWhenInUseAuthorization()
       locationManager.startUpdatingLocation()
   }
}

extension LocationManager: CLLocationManagerDelegate {
   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
       if manager.authorizationStatus == .authorizedWhenInUse {
           manager.startUpdatingLocation()
       }
   }

   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       guard let location = locations.last else { return }
       region.center.latitude = location.coordinate.latitude
       region.center.longitude = location.coordinate.longitude
   }
}

#Preview {
    Posizione()
}
