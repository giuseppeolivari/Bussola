//
//  Logic1.swift
//  Bussola
//
//  Created by Giuseppe Olivari on 18/11/23.
//

import Foundation
import SwiftUI

struct Marker: Hashable {
    let gradi: Double
    let label: String

    init(degrees: Double, label: String = "") {
        self.gradi = degrees
        self.label = label
    }

    func degreeText() -> String {
        return String(format: "%.0f", self.gradi)
    }

    static func markers() -> [Marker] {
        return [
            Marker(degrees: 0, label: "S"),
            Marker(degrees: 45),
            Marker(degrees: 90, label: "W"),
            Marker(degrees: 135),
            Marker(degrees: 180, label: "N "),
            
            Marker(degrees: 225),
            Marker(degrees: 270, label: "E"),
            Marker(degrees: 315),
            
        ]
    }
}
