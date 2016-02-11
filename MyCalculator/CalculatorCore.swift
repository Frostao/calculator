//
//  CalculatorCore.swift
//  MyCalculator
//
//  Created by Carl Chen on 2/10/16.
//  Copyright © 2016 Zhen Chen. All rights reserved.
//

import UIKit

class CalculatorCore: NSObject {
    //the core for the calculator
    
    init(label: UILabel) {

        number = 0
        isDouble = false
        formatter.numberStyle = .DecimalStyle
        formatter.maximumFractionDigits = 8
        resultLabel = label
        resultLabel.text = number.description
        numberChanged = false
        calculated = false
    }
    var number:NSNumber
    var isDouble: Bool
    var numberChanged: Bool
    var calculated: Bool
    let formatter = NSNumberFormatter()
    var numberStack = [NSNumber]()
    var operationStack = [String]()
    var resultLabel: UILabel
    
    
    
    func calculate(operation: String) {
        if numberChanged {
            if !numberStack.isEmpty {
                let op = operationStack.last
                if !((op == "plus" || op == "minus") && (operation == "multiply" || operation == "divide")) {
                    operationStack.removeLast()
                    switch op! {
                    case "plus":
                        number = numberStack.removeLast().doubleValue + number.doubleValue
                        break
                    case "minus":
                        number = numberStack.removeLast().doubleValue - number.doubleValue
                        break
                    case "divide":
                        number = numberStack.removeLast().doubleValue / number.doubleValue
                        break
                    case "multiply":
                        number = numberStack.removeLast().doubleValue * number.doubleValue
                        break
                    default:
                        break
                    }
                    evaluate()
                }
            }
            operationStack.append(operation)
            numberStack.append(number)
            number = 0
            isDouble = false
            numberChanged = false
            calculated = false
        }
    }
    
    func evaluate() {
        //evaluate everything in the stack
        if !numberStack.isEmpty {
            let operation = operationStack.removeLast()
            switch operation {
            case "plus":
                number = numberStack.removeLast().doubleValue + number.doubleValue
                break
            case "minus":
                number = numberStack.removeLast().doubleValue - number.doubleValue
                break
            case "divide":
                number = numberStack.removeLast().doubleValue / number.doubleValue
                break
            case "multiply":
                number = numberStack.removeLast().doubleValue * number.doubleValue
                break
            default:
                break
            }
            if !operationStack.isEmpty {
                evaluate()
            }
        }
        
        setResultLabel()
        calculated = true
        //number = 0
    }
    
    
    
    func setResultLabel() {
        resultLabel.text = formatter.stringFromNumber(number)
    }
    
    func getNumberOfDigits() -> Int {
        return (formatter.stringFromNumber(number)?.characters.count)!
    }
    
    func addDigit(digit: Int) {
        if getNumberOfDigits() < 12 {
            if isDouble {
                
                //number = (number?.doubleValue)! * 10 + Double(digit)
                //let index = resultLabel.text?.startIndex.advancedBy((resultLabel.text?.characters.count)!-1)
                resultLabel.text = resultLabel.text! + digit.description
                if digit == 0{
                    return
                } else {
                    number = formatter.numberFromString(resultLabel.text!)!
                }
                
                
                
            } else {
                number = number.integerValue * 10 + digit
                //resultLabel.text = resultLabel.text! + digit.description
            }
        }
        numberChanged = true
        setResultLabel()
    }
    
    func clearCalculator() {
        number = 0
        isDouble = false
        calculated = false
        setResultLabel()
        numberStack.removeAll()
        operationStack.removeAll()
    }
    
    func switchSign() {
        number = -number.doubleValue
        setResultLabel()
    }
    
    func removeLastDigit() {
        if isDouble {
            if resultLabel.text![resultLabel.text!.endIndex.advancedBy(-2)] == "." {
                isDouble = false
            }
            number = formatter.numberFromString(resultLabel.text!.substringToIndex(resultLabel.text!.endIndex.advancedBy(-1)))!
            
        } else {
            number = Int(number.doubleValue * 0.1)
        }
        setResultLabel()
    }
    
    
    func addDot() {
        if !isDouble {
            isDouble = true
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    func addPercent() {
        number = number.doubleValue * 0.01
        setResultLabel()
    }

}
