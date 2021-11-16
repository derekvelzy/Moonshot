//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Derek Velzy on 11/16/21.
//

import Foundation

// Create an extension on Bundle to easily grab, decode, and return an array of Astronauts based on an input json file

// To return generic data, use <T> (T is a placeholder, could be anything like <Type>), and whenever there's a reference to the type of data you want to return (like [String: Astronaut]) just use T instead
extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        // Format the date so that it doesn't show up like "y-MM-dd"
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        // Says that any date
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }

        return loaded
    }
}
