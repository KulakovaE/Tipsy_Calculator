//
//  ResultsViewController.swift
//  Tipsy_Calculator
//
//  Created by Darko Kulakov on 2019-11-13.
//  Copyright © 2019 Elena Kulakova. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var noteHowMuchMoney: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        noteHowMuchMoney.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        //go back in the previous VC
        self.dismiss(animated: true, completion: nil)
    }
}
