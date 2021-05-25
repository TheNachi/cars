//
//  MoctTextData.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 25/05/2021.
//

import Foundation

struct MockTestData {
    
    static let mockData = [
        SixtModel(id: "WMWXN310X0T908158",
                  modelIdentifier: "mini",
                  modelName: "MINI",
                  name: "Tabea",
                  make: "BMW",
                  group: "MINI",
                  color: "midnight_black_metal",
                  series: "MINI",
                  fuelType: "D",
                  fuelLevel: 0.55,
                  transmission: "M",
                  licensePlate: "M-DX8563",
                  latitude: 48.19004,
                  longitude: 11.574267,
                  innerCleanliness: "VERY_CLEAN",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png"),
        
        SixtModel(id: "WMWSW31010T113555",
                  modelIdentifier: "mini",
                  modelName: "MINI",
                  name: "Peggy",
                  make: "BMW",
                  group: "MINI",
                  color: "midnight_black",
                  series: "MINI",
                  fuelType: "D",
                  fuelLevel: 0.7,
                  transmission: "M",
                  licensePlate: "M-IL2642",
                  latitude: 48.130227,
                  longitude: 11.566136,
                  innerCleanliness: "VERY_CLEAN",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/mini.png"),
        
        SixtModel(id: "WBAUE51070P352494",
                  modelIdentifier: "bmw_1er",
                  modelName: "BMW 1er",
                  name: "Lasse",
                  make: "BMW",
                  group: "BMW",
                  color: "saphirschwarz",
                  series: "1er",
                  fuelType: "P",
                  fuelLevel: 0.92,
                  transmission: "M",
                  licensePlate: "M-VO0270",
                  latitude: 48.170041,
                  longitude: 11.576643,
                  innerCleanliness: "VERY_CLEAN",
                  carImageUrl: "https://cdn.sixt.io/codingtask/images/bmw_1er.png")
    
    ]
}

