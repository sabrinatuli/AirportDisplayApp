//
//  AirportData.swift
//  AirportApp
//
//  Created by Sabrina Tuli on 30/6/21.
//

import Foundation

struct GroupedAirPort: Decodable, Equatable {
    let sortedzone: String
    let data: [Airport]
    
}

struct Airport: Decodable, Equatable{
    
    let airportCode: String
    let timezone: String
    let city: String
    let state: String
    let airportName: String
    
   
}
