//
//  CacheManager.swift
//  SIXT
//
//  Created by Munachimso Ugorji on 24/05/2021.
//

import Foundation

class CacheManager {
    public static let shared = CacheManager()
    public static var inMemoryCache: [String: Any?] = [:]
    
    func cacheString(with key: String, data: String) {
        guard !key.isEmpty else { return }
        let currentDataInRam = CacheManager.inMemoryCache[key] as? String
        CacheManager.inMemoryCache[key] = data
        if (currentDataInRam != data) {
            saveToFile(with: key, text: data)
        }
    }
    
    func loadCachedString(with key: String) -> String? {
        guard !key.isEmpty else { return nil }
        if let inmemory = CacheManager.inMemoryCache[key] as? String {
            return inmemory
        } else {
            return readFromFile(with: key)
        }
    }
    
    private func saveToFile(with key: String, text: String) {
        let fileName = "\(key).json"
        if let dir = CacheManager.getFileUrl(with: fileName) {
            do {
                try text.write(to: dir, atomically: true, encoding: .utf8)
            } catch {
                print("Failed to write to file \(fileName)")
            }
        }
    }
    
    private static func getFileUrl(with fileName: String) -> URL? {
        let baseUrl = FileManager.default.urls(for: .cachesDirectory,
            in: .userDomainMask).first
        return baseUrl?.appendingPathComponent(fileName)
    }

    private func readFromFile(with key: String) -> String? {
        let fileName = "\(key).json"
        guard let url = CacheManager.getFileUrl(with: fileName) else { return nil }
        do {
            return try String(contentsOf: url, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
