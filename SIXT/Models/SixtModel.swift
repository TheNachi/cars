//
//  SixtModel.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import Foundation
import Mapbox

struct SixtModel: Decodable, Equatable {
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    var group: String
    var color: String
    var series: String
    var fuelType: String
    var fuelLevel: Double
    var transmission: String
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var innerCleanliness: String
    var carImageUrl: String
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
