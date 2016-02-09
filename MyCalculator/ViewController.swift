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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRecognizer.direction = .Right
        resultLabel.addGestureRecognizer(swipeRecognizer)
        number = 0
        isDouble = false
        resultLabel.text = number?.description
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setResultLabel() {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        resultLabel.text = formatter.stringFromNumber(number!)
        
        
    }
    
    func addDigit(digit: Int) {
        if isDouble! {
            number = (number?.doubleValue)! * 10 + Double(digit)
        } else {
            number = (number?.integerValue)! * 10 + digit
        }
        
        setResultLabel()
    }
    
    func clearCalculator() {
        number = 0
        setResultLabel()
    }
    
    func switchSign() {
        number = -(number?.doubleValue)!
        setResultLabel()
    }
    
    func removeLastDigit() {
        if isDouble! {
            
        } else {
            number = Int((number?.doubleValue)! * 0.1)
        }
        setResultLabel()
    }
    
    func swipeRight(sender: AnyObject) {
        removeLastDigit()
    }
    
    @IBAction func acButtonPressed(sender: AnyObject) {
        clearCalculator()
    }
    @IBAction func positiveButtonPressed(sender: AnyObject) {
        switchSign()
    }
    @IBAction func percentButtonPressed(sender: AnyObject) {
    }
    @IBAction func divideButtonPressed(sender: AnyObject) {
        
    }
    @IBAction func multiplyButtonPressed(sender: AnyObject) {
        
    }
    @IBAction func minusButtonPressed(sender: AnyObject) {
        
    }
    @IBAction func plusButtonPressed(sender: AnyObject) {
        
    }
    @IBAction func equalButtonPressed(sender: AnyObject) {
        
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
        
    }
    
}



