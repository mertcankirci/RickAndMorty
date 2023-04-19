//
//  RMSingleLocation.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMSingleLocation: Codable, Hashable {
    let name : String
    let url : String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
    static func == (lhs: RMSingleLocation, rhs: RMSingleLocation) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
