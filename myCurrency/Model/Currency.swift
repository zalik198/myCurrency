//
//  Currency.swift
//  myCurrency
//
//  Created by Shom on 07.09.2020.
//  Copyright © 2020 Shom. All rights reserved.
//

import Foundation

struct Currency: Codable {
    
    let date: String
    let previousDate: String
    let valute: [String: Valute]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case previousDate = "PreviousDate"
        case valute = "Valute"
    }
}

struct Valute: Codable {

    let name: String
    let value: Double
    let previous: Double


    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
       }
}
