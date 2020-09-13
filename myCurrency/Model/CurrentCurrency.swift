//
//  CurrentCurrency.swift
//  myCurrency
//
//  Created by Shom on 10.09.2020.
//  Copyright © 2020 Shom. All rights reserved.
//

import Foundation

struct CurrentCurrency {
    let date: String
    let previousDate: String
    let nameUSD: String?
    let nameEURO: String?
    let nameGBP: String?
    
    let valueUSD: Double?
    var valueUSDString: String {
        return "\(valueUSD!)"
    }
    
    let previousUSD: Double?
    var previousUSDString: String {
        return "\(previousUSD!)"
    }
    
    let valueEURO: Double?
    var valueEUROString: String {
        return "\(valueEURO!)"
       }
    
    let previousEURO: Double?
    var previousEUROString: String {
        return "\(previousEURO!)"
       }
    
    let valueGBP: Double?
    var valueGBPString: String {
        return "\(valueGBP!)"
       }
    
    let previousGBP: Double?
    var previousGBPString: String {
        return "\(previousGBP!)"
       }
    
    
    init(currentCurrency: Currency) {
        date = currentCurrency.date
        previousDate = currentCurrency.previousDate
        nameUSD = currentCurrency.valute["USD"]!.name
        valueUSD = currentCurrency.valute["USD"]!.value
        previousUSD = currentCurrency.valute["USD"]!.previous
        nameEURO = currentCurrency.valute["EUR"]!.name
        valueEURO = currentCurrency.valute["EUR"]!.value
        previousEURO = currentCurrency.valute["EUR"]!.previous
        nameGBP = currentCurrency.valute["GBP"]!.name
        valueGBP = currentCurrency.valute["GBP"]?.value
        previousGBP = currentCurrency.valute["GBP"]?.previous

    }
}
