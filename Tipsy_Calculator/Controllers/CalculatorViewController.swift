//
//  ViewController.swift
//  Tipsy_Calculator
//
//  Created by Darko Kulakov on 2019-11-13.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var splitNumberlabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        switch sender {
        case zeroPctBtn:
            zeroPctBtn.isSelected = true
            tenPctBtn.isSelected = false
            twentyPctBtn.isSelected = false
        case tenPctBtn:
            tenPctBtn.isSelected = true
            zeroPctBtn.isSelected = false
            twentyPctBtn.isSelected = false
        case twentyPctBtn:
            zeroPctBtn.isSelected = false
            tenPctBtn.isSelected = false
            twentyPctBtn.isSelected = true
        default:
            sender.isSelected = false
        }
        
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
        if let bill = billTextField.text {
            if bill != "" {
                //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
                //e.g. 125.50
                billTotal = Double(bill) ?? 0.0
                //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
                let result = billTotal * (1 + tip) / Double(numberOfPeople)
                //Round the result to 2 decimal places and turn it into a String.
                finalResult = String(format: "%.2f", result)
            }
        }
        self.performSegue(withIdentifier: "ResultsViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip*100)
            destinationVC.split = numberOfPeople
        }
    }
}

