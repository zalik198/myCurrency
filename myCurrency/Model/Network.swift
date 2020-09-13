//
//  Network.swift
//  myCurrency
//
//  Created by Shom on 07.09.2020.
//  Copyright © 2020 Shom. All rights reserved.
//

import Foundation

class Network {
    
    var onCompletion: ((CurrentCurrency) -> Void)?

    func currency() {
    let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
    guard let url = URL(string: urlString) else { return }
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { data, response, error in
        if let data = data {
                if let newCurrentCurrency = self.parseJSON(withData: data) {
                self.onCompletion?(newCurrentCurrency)
                }
            }
        
        }
        task.resume()
    }
    
    //paesing JSON
    func parseJSON(withData data: Data) -> CurrentCurrency? {
        let decoder = JSONDecoder()
        do {
        let currency = try decoder.decode(Currency.self, from: data)

            let myCurrency = CurrentCurrency(currentCurrency: currency)
            return myCurrency

        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    

    
    
    
    

}
