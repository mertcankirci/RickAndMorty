//
//  RMOrigin.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMOrigin: Codable, Equatable {
    let name : String
    let url : String
    
    static func == (lhs: RMOrigin, rhs: RMOrigin) -> Bool {
        return lhs.name == rhs.name && lhs.url == rhs.url
    }
}
