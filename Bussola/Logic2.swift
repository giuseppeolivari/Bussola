//
//  Logic2.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 18/11/23.
//

import Foundation
import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassDegress: Double

    var body: some View {
        VStack {
        Text(marker.degreeText())
                .fontWeight(.light)
                .rotationEffect(self.textAngle())
            
            Capsule()
                .frame(width: self.capsuleWidth(),
                       height: self.capsuleHeight())
                .foregroundColor(self.capsuleColor())
                .padding(.bottom, 130)
            
            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(self.textAngle())
                .padding(.bottom, 80)
        }.rotationEffect(Angle(degrees: marker.gradi))
    }
    
    private func capsuleWidth() -> CGFloat {
        return self.marker.gradi == 0 ? 7 : 3
    }

    private func capsuleHeight() -> CGFloat {
        return self.marker.gradi == 0 ? 45 : 30
    }

    private func capsuleColor() -> Color {
        return self.marker.gradi == 0 ? .red : .gray
    }

    private func textAngle() -> Angle {
        return Angle(degrees: -self.compassDegress - self.marker.gradi)
    }
}
