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
    @IBOutlet weak var twelvePctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var splitNumberlabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //var bill = Float(billTextField.text ?? "0.0")
        switch sender {
        case zeroPctBtn:
            zeroPctBtn.isSelected = true
            tenPctBtn.isSelected = false
            twelvePctBtn.isSelected = false
            print((Float(0) / Float(100)))
        case tenPctBtn:
            tenPctBtn.isSelected = true
            zeroPctBtn.isSelected = false
            twelvePctBtn.isSelected = false
            print (Float(10) / Float(100))
        case twelvePctBtn:
            twelvePctBtn.isSelected = true
            zeroPctBtn.isSelected = false
            tenPctBtn.isSelected = false
            print (Float(20) / Float(100))
        default:
            "Something is wrong"//nz so da praam so voa
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func textFieldTapped(_ sender: Any) {

        //UIKeyboardAppearance.self
    }
    @IBAction func steperValueChanged(_ sender: UIStepper) {
        splitNumberlabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(Int(billTextField.text ?? "0"))
    }
}

