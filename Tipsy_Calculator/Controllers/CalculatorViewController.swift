//
//  ViewController.swift
//  Tipsy_Calculator
//
//  Created by Darko Kulakov on 2019-11-13.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var splitNumberlabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //Dismiss the keyboard when the user chooses one of the tip values.
        billTextField.endEditing(true)
        
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func steperValueChanged(_ sender: UIStepper) {
        splitNumberlabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Get the text the user typed in the billTextField
        let bill = billTextField.text!
        
        //If the text is no empty String
        if bill != "" {
        //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
                   //e.g. 125.50
        billTotal = Double(bill)!
            //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            //Round the result to 2 decimal places and turn it into a String.
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            
        }
    }
}

