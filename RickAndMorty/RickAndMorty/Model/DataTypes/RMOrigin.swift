//
//  RMOrigin.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMOrigin: Codable, Equatable, Hashable {
    let name : String
    let url : String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(url)
    }
    
    static func == (lhs: RMOrigin, rhs: RMOrigin) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
