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
    
    var calulatorCore:CalculatorCore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRecognizer.direction = .Right
        resultLabel.addGestureRecognizer(swipeRecognizer)
        calulatorCore = CalculatorCore(label: resultLabel)
        CalculatorCore.sharedInstance = calulatorCore

    }
    
    
    func swipeRight(sender: AnyObject) {
        calulatorCore?.removeLastDigit()
    }
    
    @IBAction func acButtonPressed(sender: AnyObject) {
        calulatorCore?.clearCalculator()
    }
    @IBAction func positiveButtonPressed(sender: AnyObject) {
        calulatorCore?.switchSign()
    }
    @IBAction func percentButtonPressed(sender: AnyObject) {
        calulatorCore?.addPercent()
    }
    @IBAction func divideButtonPressed(sender: AnyObject) {
        calulatorCore?.calculate("divide")
    }
    @IBAction func multiplyButtonPressed(sender: AnyObject) {
        calulatorCore?.calculate("multiply")
    }
    @IBAction func minusButtonPressed(sender: AnyObject) {
        calulatorCore?.calculate("minus")
    }
    @IBAction func plusButtonPressed(sender: AnyObject) {
        calulatorCore?.calculate("plus")
    }
    @IBAction func equalButtonPressed(sender: AnyObject) {
        
        calulatorCore?.handleEqual()
    }
    @IBAction func number1Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(1)
    }
    @IBAction func number2Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(2)
    }
    @IBAction func number3Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(3)
    }
    @IBAction func number4Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(4)
    }
    @IBAction func number5Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(5)
    }
    @IBAction func number6Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(6)
    }
    @IBAction func number7Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(7)
    }
    @IBAction func number8Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(8)
    }
    @IBAction func number9Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(9)
    }
    @IBAction func number0Pressed(sender: AnyObject) {
        calulatorCore?.addDigit(0)
    }
    @IBAction func dotPressed(sender: AnyObject) {
        calulatorCore?.addDot()
    }
    
}



