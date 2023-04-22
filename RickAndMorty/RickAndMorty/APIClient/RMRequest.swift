//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Mertcan Kırcı on 16.04.2023.
//

import SwiftUI

final class RMRequest {
    
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents : [String]
    
    private let queryParameters : [URLQueryItem]
    
    private var page: Int = 1
    
    
    
    private var urlString : String {
        var string = Constants.baseUrl
        
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            
            
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
            
            
        }

        return string
        
    }
    
    public let httpMethod = "GET"
    
    public var url : URL? {
        return URL(string: urlString)
    }
    
    public init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension RMRequest {
    static let listOfCharactersRequest = RMRequest(endpoint: .character)
    static let listOfLocationsRequest = RMRequest(endpoint: .location)//MARK: Pagination here
}
