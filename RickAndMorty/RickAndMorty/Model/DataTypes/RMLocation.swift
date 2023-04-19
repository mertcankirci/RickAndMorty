//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMLocation: Codable, Hashable, Equatable {
    let id : Int
    let name : String
    let type : String
    let dimension : String
    let residents : [String]
    let url : String
    let created : String
    
    static func == (lhs: RMLocation, rhs: RMLocation) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.type == rhs.type
        && lhs.dimension == rhs.dimension
        && lhs.residents == rhs.residents
        && lhs.url == rhs.url
        && lhs.created == rhs.created
    }
}
