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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Gets billAmount value
        let billAmount:Double = Double(self.billAmountTextField.text!) ?? 0.0
        let tipPercentages:[Double] = [0.15, 0.18, 0.2]
        // Calculate tip by multiplying billAmount by selected tipPercentage
        let tip = billAmount*tipPercentages[tipControl.selectedSegmentIndex]
        
        
        // Calculate total by adding tip + billAmount
        let total = tip+billAmount
        
        // Updates text labels with correct toatls
        tipAmountLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f",total)
        
        
        
        
    }
    
}

