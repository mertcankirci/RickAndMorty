//
//  RMSingleLocation.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMSingleLocation: Codable {
    let name : String
    let url : String
    
    static func == (lhs: RMSingleLocation, rhs: RMSingleLocation) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
