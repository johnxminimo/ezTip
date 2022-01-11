//
//  ViewController.swift
//  Prework
//
//  Created by John Minimo on 12/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperCount: UILabel!
    @IBOutlet weak var stepperCounter: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        // Gets billAmount value
        let billAmount:Double = Double(self.billAmountTextField.text!) ?? 0.0
        let tipPercentages:[Double] = [0.15, 0.18, 0.2]
        // Calculate tip by multiplying billAmount by selected tipPercentage
        let tip = billAmount*tipPercentages[tipControl.selectedSegmentIndex]

        
        // Calculate total by adding tip + billAmount
        let total = tip+billAmount
        let personCount:Double = Double(self.stepperCounter.text!) ?? 0.0
        
        let totalPerP = total/personCount
        
        
        // Updates text labels with correct toatls
        tipAmountLabel.text = String( format: "$%.2f", tip)
        totalLabel.text =  String(format: "$%.2f",total)
        totalPerPerson.text = String(format:"Total Per Person: $%.2f", totalPerP)
        
        
        
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperCounter.text = Int(sender.value).description
    }
    
}

