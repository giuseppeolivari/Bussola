//
//  ContentView.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 18/11/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
//import CoreHaptics





struct ContentView : View {
    @ObservedObject var compassHeading = CompassHeading()

    @StateObject var locationManager = LocationManager()
    
    
    
    var body: some View {
        

        NavigationStack{
            
            VStack(alignment: .center) {
                
                ZStack{
                    /*
                     Text("|")
                     .font(.system(size: 60))
                     .fontWeight(.bold)
                     */
                    
                    /* Image(systemName: "location.north.circle")
                     .font(.system(size: 70))
                     //.fontWeight(.bold)
                     */
                    
                    /*
                     Image(systemName: "location.north.line.fill")
                     .font(.system(size: 50))
                     //.fontWeight(.bold)
                     */
                    
                    Image(systemName: "plus")
                        .font(.system(size: 70))
                    //.fontWeight(.bold)
                    ZStack {
                        
                        
                        
                        ForEach(Marker.markers(), id: \.self) { marker in
                            CompassMarkerView(marker: marker,
                                              compassDegress: self.compassHeading.gradi)
                        }
                        
                    }
                    .frame(width: 320, height: 320)
                    .rotationEffect(Angle(degrees: self.compassHeading.gradi))
                    .statusBar(hidden: true)
                    
                }
                /* ZStack{
                 Image(systemName: "location.north.fill")
                 .font(.system(size: 50))
                 }
                 */
            }
            .accessibilityHidden(true)
            
            
            
            VStack(alignment: .center){
                
                if(self.compassHeading.gradi  < -337.00 && self.compassHeading.gradi  < 0){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° N")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                
                
                else if(self.compassHeading.gradi  > -22.00 && self.compassHeading.gradi  < 0.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° N")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -67.00 && self.compassHeading.gradi  <= -22.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° NE")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -112.00 && self.compassHeading.gradi  <= -67.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° E")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -157.00 && self.compassHeading.gradi  <= -112.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° SE")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -202.00 && self.compassHeading.gradi  <= -157.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° S")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -247.00 && self.compassHeading.gradi  <= -202.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° SW")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -292.00 && self.compassHeading.gradi  <= -247.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° W")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else if(self.compassHeading.gradi  > -337.00 && self.compassHeading.gradi  <= -292.00){
                    Text("\(String(format: "%.0f", self.compassHeading.gradi * -1))° NW")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                
                else {
                    Text("0°N")
                        .font(.largeTitle)
                }
                
                
                
            } .padding()
            
            
            
            
            VStack(alignment: .center){
                
                
                
                Text("Lat:")
                + Text(String(format: "%.4f", locationManager.region.center.latitude))
                
                Text("Long:")
                + Text(String(format: "%.4f", locationManager.region.center.longitude))
                
                
                
                
                /*Button("", systemImage: "map") {
                 
                 }.font(.system(size: 60))
                 .padding(.top, 50.0)
                 */
                
                NavigationLink(destination: Posizione()) {
                    Image(systemName: "map")
                        .foregroundColor(.colorMap)
                    /*.foregroundColor(Color(red: 0.007, green: 0.311, blue: 0.41, opacity: 0.88)) */
                        .font(.system(size: 50))
                }.padding(.top, 60.0).accessibilityLabel("Map").accessibilityHint("This button opens the map")
                
                
                
            }
            
        }
        
       

    }
    
}

#Preview {
    ContentView()
}

/*
 
 @State private var feedback: CHHapticEngine?
 
 @State var counter = true
 
 func prepareHaptics() {
     guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

     do {
         // Creare un motore haptico
                     let engine = try CHHapticEngine()

                     // Avvia il motore haptico
                     try engine.start()

                     // Crea un evento haptico
                     let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
                     let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
                     let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

                     // Crea un pattern haptico
                     let pattern = try CHHapticPattern(events: [event], parameters: [])

                     // Crea un player haptico
                     let player = try engine.makePlayer(with: pattern)

                     // Riproduci il feedback aptico
                     try player.start(atTime: 0)
     } catch {
         print("There was an error creating the engine: \(error.localizedDescription)")
     }
 }
 
 
 
 
 
 
 
 if(self.compassHeading.gradi  == -0.00 || self.compassHeading.gradi  == -45.00 || self.compassHeading.gradi  == -90.00 || self.compassHeading.gradi  == -135.00 || self.compassHeading.gradi  == -180.00 || self.compassHeading.gradi  == -225.00 || self.compassHeading.gradi  == -270.00 || self.compassHeading.gradi  == -315.00)
{
  
    
}

 
 
 
 
 .sensoryFeedback(.impact(weight: .heavy, intensity: 3), trigger: counter)
 
 */
