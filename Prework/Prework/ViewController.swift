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
    let defaultTipPerc: [Double] = [0.15,0.18,0.20]
    var billAmount:Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    @IBAction func calculateTip(_ sender: Any) {
        updateBill()
        
        
    }
    // Function which updates bill and totals with correct content
    func updateBill(){
        // Bill Value to billAmount constant
        billAmount = Double(billAmountTextField.text!) ?? 0.0
        
        // Get person count from stepper
        let personCount:Double = Double(stepperCounter.text!) ?? 1.0
        
        // Calculate tip from subtotal bill amount
        let tip:Double = billAmount*defaultTipPerc[tipControl.selectedSegmentIndex]
        
        // Calculate total bill
        let totalBillAmount:Double = tip+billAmount
        
        
        // Calculate split value if multiple people are present
        var splitBill:Double
        if personCount > 1 {
            splitBill = totalBillAmount/personCount
        } else {
            splitBill = totalBillAmount
        }
        
        // Update text labels with correct total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalBillAmount)
        totalPerPerson.text = String(format:"Total Per Person: $%.2f", splitBill)
        
        
    }
    
    // Tracks which checks if stepper has been increased or decreased then calls updateBill()
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperCounter.text = Int(sender.value).description
        updateBill()
    }
    
    // Track when billAmount is changed and calls updateBill()
    @IBAction func billAmountChanged(_ sender: UITextField) {
        billAmount = Double(billAmountTextField.text!) ?? 0.0
        updateBill()
        
    }
}

