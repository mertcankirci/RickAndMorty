//
//  RMGetAllLocationResponse.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 17.04.2023.
//

import SwiftUI

struct RMGetAllLocationResponse: Codable {
    let info: RMGetAllCharactersResponseInfo
    let results: [RMLocation]
}
