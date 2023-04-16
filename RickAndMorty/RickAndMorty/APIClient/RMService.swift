//
//  RMService.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute <T:Codable> (_ request: RMRequest,
                                     expecting type: T.Type ,
                                     completion: @escaping (Result<T, Error>) -> Void)
    {
        
    }
}
