//
//  ViewController.swift
//  myCurrency
//
//  Created by Shom on 07.09.2020.
//  Copyright © 2020 Shom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var previousDate: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var usd: UILabel!
    @IBOutlet weak var usdPreviousCurrency: UILabel!
    @IBOutlet weak var usdCurrency: UILabel!
    @IBOutlet weak var euro: UILabel!
    @IBOutlet weak var euroPreviousCurrency: UILabel!
    @IBOutlet weak var euroCurrency: UILabel!
    @IBOutlet weak var gbp: UILabel!
    @IBOutlet weak var gbpPreviousCurrency: UILabel!
    @IBOutlet weak var gbpCurrency: UILabel!
    
    
    var network = Network()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view outlets
        self.usd.layer.cornerRadius = 15
        self.usd.layer.borderWidth = 1
        self.usd.textAlignment = .center
        self.euro.layer.cornerRadius = 15
        self.euro.layer.borderWidth = 1
        self.euro.textAlignment = .center
        self.gbp.layer.cornerRadius = 15
        self.gbp.layer.borderWidth = 1
        self.gbp.textAlignment = .center
        
        network.currency()
        network.onCompletion = { newCurrentCurrency in
            
            //date format to string
            let prevDate = self.getFormattedDate(date: newCurrentCurrency.previousDate)
            let date = self.getFormattedDate(date: newCurrentCurrency.date)
            
            //main thread
            DispatchQueue.main.async {
                self.previousDate.text = "с \(prevDate)"
                self.date.text = "с \(date)"
                self.usd.text = newCurrentCurrency.nameUSD
                self.usdPreviousCurrency.text = newCurrentCurrency.previousUSDString
                self.usdCurrency.text = newCurrentCurrency.valueUSDString
                self.euro.text = newCurrentCurrency.nameEURO
                self.euroPreviousCurrency.text = newCurrentCurrency.previousEUROString
                self.euroCurrency.text = newCurrentCurrency.valueEUROString
                self.gbp.text = newCurrentCurrency.nameGBP
                self.gbpPreviousCurrency.text = newCurrentCurrency.previousGBPString
                self.gbpCurrency.text = newCurrentCurrency.valueGBPString

            }
            
        }
            
        }
    
    //Convert dateFormat
    func getFormattedDate(date: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let converDate = dateFormat.date(from: date)
        
        guard dateFormat.date(from: date) != nil else {
            assert(false, "no date")
            return ""
        }
        
        dateFormat.dateFormat = "dd.MM.yyyy"
        let stringDate = dateFormat.string(from: converDate!)

        return stringDate
        }
        
        
    }




