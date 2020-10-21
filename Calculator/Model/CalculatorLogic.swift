//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Noam Moyal on 07/08/2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number{
            if symbol == "+/-"{
                return n * -1
                
            } else if symbol == "AC"{
                return 0
                
            } else if symbol == "%"{
                return n / 100
            }else if symbol == "="{
                return performTwoNumCalculation(n2: n)
            }else {
                intermediateCalculation = (n1: n, calcMethod: symbol)
                }
            }
        return nil
    }
    private func performTwoNumCalculation(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
                
            case "-":
                return n1 - n2
                
            case "×":
                return n1 * n2
            
            case "÷":
                return n1 / n2
                
            default:
                fatalError("operation passed in doesnt match any cases")
                
            }
        }
        return nil
    }
    
    
}
/*
 if operation == "+"{
        return n1 + n2
        }else if operation == "*"{
                return n1 * n2
        }else if operation == "-"{
            return n1 - n2
        }else {
            return  n1 / n2
    }
 
 */
