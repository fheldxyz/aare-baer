//
//  bundle-decode.swift
//  aare-baer
//
//  Created by user on 10.07.21.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(file: String) -> T {
        
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("\(file) not found")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load")
        }
        
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("decoding failed")
        }
        
        return decoded
    }
    
}

