//
//  SixtNetworkService.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import Foundation

struct SixtNetworkService {
    private let baseURL = StringConstants.baseURL.rawValue
    private let sixtNetworkcache = SixtNetworkCache()
    weak var delegate: SixtNetworkServiceDelegate?
    
    func getCars() {
        if Reachability.isConnectedToNetwork() {
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
        } else {
            self.sixtNetworkcache.loadCharacterFromCache(delegate: delegate)
        }
    }
    
    func parseJSON(carsData: Data) {
        let stringValue = carsData.base64EncodedString()
        let decoder = JSONDecoder()
        do {
            let cars = try decoder.decode([SixtModel].self, from: carsData)
            self.delegate?.onGetCars(cars: cars)
            CacheManager.inMemoryCache.updateValue(cars, forKey: StringConstants.sixtNetworkCacheKey.rawValue)
            CacheManager.shared.cacheString(with: StringConstants.sixtNetworkCacheKey.rawValue, data: stringValue)
        } catch {
            print(error)
        }
    }
}

protocol SixtNetworkServiceDelegate: class {
    func onGetCars(cars: [SixtModel])
}

struct SixtNetworkCache {
    func loadCharacterFromCache(delegate: SixtNetworkServiceDelegate?) {
        DispatchQueue.main.async {
            if let inMemoryCars = CacheManager.inMemoryCache[StringConstants.sixtNetworkCacheKey.rawValue] as? [SixtModel] {
                delegate?.onGetCars(cars: inMemoryCars)
            } else {
                if let cacheCharacters = CacheManager.shared.loadCachedString(with: StringConstants.sixtNetworkCacheKey.rawValue) {
                    if let cachedData = Data(base64Encoded: cacheCharacters) {
                        let decoder = JSONDecoder()
                        do {
                            let cars = try decoder.decode([SixtModel].self, from: cachedData)
                            delegate?.onGetCars(cars: cars)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }

}
