//
//  Errors.swift
//  SuperHeroComics-Surf
//
//  Created by Игорь Попов on 15.02.2021.
//  Copyright © 2021 AirIgor. All rights reserved.
//

import Foundation

enum Errors: LocalizedError {
    
    case errorLink
    case errorResponse
    case errorConnection
    case errorParsing
    
    var errorDescription: String? {
        switch self {
        case .errorLink:
            return "Bad url link"
        case .errorResponse:
            return "The response code is bad"
        case .errorConnection:
            return "No data was provided by server"
        case .errorParsing:
            return "Failed to decode JSON from server"
        }
    }
}
