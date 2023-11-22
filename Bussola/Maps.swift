//
//  Maps.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 18/11/23.
//

import SwiftUI
import MapKit

struct Maps: View {
    @State private var userCoordinate: CLLocationCoordinate2D?
    
    var body: some View {
        VStack {
            if let userCoordinate = userCoordinate {
                MapView(userCoordinate: $userCoordinate)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.all)

                Text("Latitude: \(userCoordinate.latitude), Longitude: \(userCoordinate.longitude)")
                    .padding()
            } else {
                Text("Waiting for location...")
                
            }
        }
    }
}

#Preview {
    Maps()
}

