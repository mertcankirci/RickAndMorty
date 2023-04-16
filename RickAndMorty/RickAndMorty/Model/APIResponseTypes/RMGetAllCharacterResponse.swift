//
//  RMGetCharacterResponse.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

struct RMGetAllCharactersResponse : Codable {
    let info: RMGetAllCharactersResponseInfo
    let results: [RMCharacter]
}

struct RMGetAllCharactersResponseInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
