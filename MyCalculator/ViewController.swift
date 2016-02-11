//
//  ViewController.swift
//  MyCalculator
//
//  Created by Carl Chen on 2/8/16.
//  Copyright © 2016 Zhen Chen. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var number:NSNumber?
    var isDouble: Bool?
    let formatter = NSNumberFormatter()
    var numberStack = [NSNumber]()
    var operationStack = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRecognizer.direction = .Right
        resultLabel.addGestureRecognizer(swipeRecognizer)
        
        
        number = 0
        isDouble = false
        formatter.numberStyle = .DecimalStyle
        formatter.maximumFractionDigits = 8
        resultLabel.text = number?.description
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func calculate(operation: String) {
        if !numberStack.isEmpty {
            let op = operationStack.last
            if !((op == "+" || op == "-") && (operation == "*" || operation == "/")) {
                
                switch operation {
                case "plus":
                    number = numberStack.removeLast().doubleValue + (number?.doubleValue)!
                    break
                case "minus":
                    number = numberStack.removeLast().doubleValue - (number?.doubleValue)!
                    break
                case "divide":
                    number = numberStack.removeLast().doubleValue / (number?.doubleValue)!
                    break
                case "multiply":
                    number = numberStack.removeLast().doubleValue * (number?.doubleValue)!
                    break
                default:
                    break
                }
            }
        }
        operationStack.append(operation)
        numberStack.append(number!)
        setResultLabel()
    }
    
    func doEquals() {
        if !numberStack.isEmpty {
            let operation = operationStack.removeLast()
            switch operation {
            case "plus":
                number = numberStack.removeLast().doubleValue + (number?.doubleValue)!
                break
            case "minus":
                number = numberStack.removeLast().doubleValue - (number?.doubleValue)!
                break
            case "divide":
                number = numberStack.removeLast().doubleValue / (number?.doubleValue)!
                break
            case "multiply":
                number = numberStack.removeLast().doubleValue * (number?.doubleValue)!
                break
            default:
                break
            }
            doEquals()
        }
        setResultLabel()
    }
    
    
    
    func setResultLabel() {
        resultLabel.text = formatter.stringFromNumber(number!)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func addDigit(digit: Int) {
        if isDouble! {
            
            //number = (number?.doubleValue)! * 10 + Double(digit)
            //let index = resultLabel.text?.startIndex.advancedBy((resultLabel.text?.characters.count)!-1)
            resultLabel.text = resultLabel.text! + digit.description
            if digit == 0{
                return
            } else {
                number = formatter.numberFromString(resultLabel.text!)
            }
            
            
            
        } else {
            number = (number?.integerValue)! * 10 + digit
            //resultLabel.text = resultLabel.text! + digit.description
        }
        
        setResultLabel()
    }
    
    func clearCalculator() {
        number = 0
        isDouble = false
        setResultLabel()
    }
    
    func switchSign() {
        number = -(number?.doubleValue)!
        setResultLabel()
    }
    
    func removeLastDigit() {
        if isDouble! {
            if resultLabel.text![resultLabel.text!.endIndex.advancedBy(-2)] == "." {
                isDouble = false
            }
            number = formatter.numberFromString(resultLabel.text!.substringToIndex(resultLabel.text!.endIndex.advancedBy(-1)))
            
        } else {
            number = Int((number?.doubleValue)! * 0.1)
        }
        setResultLabel()
    }
    
    func swipeRight(sender: AnyObject) {
        removeLastDigit()
    }
    
    func addDot() {
        if !isDouble! {
            isDouble = true
            resultLabel.text = resultLabel.text! + "."
        }
    }
    
    func addPercent() {
        number = (number?.doubleValue)! * 0.01
        setResultLabel()
    }
    
    
    @IBAction func acButtonPressed(sender: AnyObject) {
        clearCalculator()
    }
    @IBAction func positiveButtonPressed(sender: AnyObject) {
        switchSign()
    }
    @IBAction func percentButtonPressed(sender: AnyObject) {
        addPercent()
    }
    @IBAction func divideButtonPressed(sender: AnyObject) {
        calculate("divide")
    }
    @IBAction func multiplyButtonPressed(sender: AnyObject) {
        calculate("multiply")
    }
    @IBAction func minusButtonPressed(sender: AnyObject) {
        calculate("minus")
    }
    @IBAction func plusButtonPressed(sender: AnyObject) {
        calculate("plus")
    }
    @IBAction func equalButtonPressed(sender: AnyObject) {
        calculate("nil")
    }
    @IBAction func number1Pressed(sender: AnyObject) {
        addDigit(1)
    }
    @IBAction func number2Pressed(sender: AnyObject) {
        addDigit(2)
    }
    @IBAction func number3Pressed(sender: AnyObject) {
        addDigit(3)
    }
    @IBAction func number4Pressed(sender: AnyObject) {
        addDigit(4)
    }
    @IBAction func number5Pressed(sender: AnyObject) {
        addDigit(5)
    }
    @IBAction func number6Pressed(sender: AnyObject) {
        addDigit(6)
    }
    @IBAction func number7Pressed(sender: AnyObject) {
        addDigit(7)
    }
    @IBAction func number8Pressed(sender: AnyObject) {
        addDigit(8)
    }
    @IBAction func number9Pressed(sender: AnyObject) {
        addDigit(9)
    }
    @IBAction func number0Pressed(sender: AnyObject) {
        addDigit(0)
    }
    @IBAction func dotPressed(sender: AnyObject) {
        addDot()
    }
    
}



