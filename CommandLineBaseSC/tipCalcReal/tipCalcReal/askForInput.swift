//
//  calculator.swift
//  tipCalcReal
//
//  Created by Sondra Clark on 10/10/16.
//  Copyright © 2016 Sondra Clark. All rights reserved.
//

import Foundation

class TipCalculator {
    public var done: Bool = false
    public var billInput: String = ""
    public var salesTaxInput: String = ""
    public var serviceInput: String = ""
    public var partyInput: String = "1"
    public var io = Io()
    
    
    func go () {
        while !done {
            
            //Ask the user for input.
            io.writeMessage("\nHow much was the bill?")
            billInput = io.getInput()
            
            if billInput == "" {
                done = true
            } else {
                print("The bill is $\(billInput)")
                
                return salesTax()
                
            }
            
        }
        print("Exiting...")
        
        return
    }
    
    
    func salesTax () {
        while !done {
            
            io.writeMessage("\nWhat is your state's sales tax percentage?")
            salesTaxInput = io.getInput()
            
            if salesTaxInput == "" {
                done = true
            } else {
                print("Your sales tax is \(salesTaxInput)%")
                
                return service()
            }
            
        }
    }
    
    func service () {
        while !done {
            
            io.writeMessage("\nWhat tip percentage fits your service?")
            serviceInput = io.getInput()
            
            if serviceInput == "" {
                done = true
            } else {
                print("The service percentage is \(serviceInput)%")
                
                return party()
            }
        }
    }
    
    
    func party () {
        while !done {
            
            io.writeMessage("\nHow many people are splitting the bill?")
            partyInput = io.getInput()
            
            if partyInput == "" {
                done = true
            } else {
                print("There are \(partyInput) people in your party.")
                
                return calculateTip()
            }
        }
    }
    
    func calculateTip() {
        
        let tipInDecimal: Double? = Double(serviceInput)! / 100
        let salesTaxDecimal: Double? = Double(salesTaxInput)! / 100
        let billInDouble: Double? = Double(billInput)!
        let billTax = salesTaxDecimal! * billInDouble!
        let partyInDouble: Double? = Double(partyInput)!
        let tipTotal = (billTax + billInDouble! * tipInDecimal!) / partyInDouble!
        
        print("Your total cost will be $\(tipTotal)")
        
        return go()
        
    }
}
