//
//  SixtNetworkService.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import Foundation

struct SixtNetworkService {
    private let baseURL = StringConstants.baseURL.rawValue
    weak var delegate: SixtNetworkServiceDelegate?
    
    func getCars() {
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }
                
                if let carsData = data {
                    self.parseJSON(carsData: carsData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(carsData: Data) {
        let decoder = JSONDecoder()
        do {
            let cars = try decoder.decode([SixtModel].self, from: carsData)
            self.delegate?.onGetCars(cars: cars)
        } catch {
            print(error)
        }
    }
}

protocol SixtNetworkServiceDelegate: class {
    func onGetCars(cars: [SixtModel])
}
