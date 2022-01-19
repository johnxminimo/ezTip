//
//  ViewController.swift
//  Prework
//
//  Created by John Minimo on 12/27/21.
//

import UIKit
import Darwin


class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperCount: UILabel!
    @IBOutlet weak var stepperCounter: UILabel!
    let defaultTipPerc: [Double] = [15,18,20]
    var tipPerc: [Double] = [0.0,0.0,0.0]
    var customTipPerc: [Double] = [0.0,0.0,0.0]
    var billAmount:Double = 0.0
    @IBOutlet weak var roundBillSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
   

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        updateCustomTipPerc()
        updateTipControl()
        
    }
       
    @IBAction func calculateTip(_ sender: Any) {
        updateBill()

        print(customTipPerc[0])
        
        
    }
    
    
    // function that causes tipPerc array to use correct tip Percentage
    func updateTipControl(){
        if customTipPerc[0] == 0.0 { tipPerc[0] = defaultTipPerc[0] }
        else {
            tipPerc[0] = customTipPerc[0]
            setTipSegmentControl()
        }
        
        if customTipPerc[1] == 0.0 { tipPerc[1] = defaultTipPerc[1] }
        else {
            tipPerc[1] = customTipPerc[1]
            setTipSegmentControl()
        }
        
        if customTipPerc[2] == 0.0 { tipPerc[2] = defaultTipPerc[2] }
        else {
            tipPerc[2] = customTipPerc[2]
            setTipSegmentControl()
        }
        
        
    }
    
    // function that sets the tipControl segemented control to the correct values
    func setTipSegmentControl() {
        tipControl.setTitle(String(format: "%.0f%%", tipPerc[0]), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%.0f%%", tipPerc[1]), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%.0f%%", tipPerc[2]), forSegmentAt: 2)
    }
    
    
    // Function that updates customTipPerc array to User's saved tips
    func updateCustomTipPerc(){
        let varCustomTipOne = defaults.double(forKey: "CustomTipValueOne")
        let varCustomTipTwo = defaults.double(forKey: "CustomTipValueTwo")
        let varCustomTipThree = defaults.double(forKey: "CustomTipValueThree")
        customTipPerc[0] = varCustomTipOne
        customTipPerc[1] = varCustomTipTwo
        customTipPerc[2] = varCustomTipThree
        for i in stride(from: 0, to: customTipPerc.endIndex, by: 1){
            print(customTipPerc[i])
        }
    }
    
    
    // Function which updates bill and totals with correct content
    func updateBill(){
        updateCustomTipPerc()
        // Bill Value to billAmount constant
        billAmount = Double(billAmountTextField.text!) ?? 0.0
        
        // Get person count from stepper
        let personCount:Double = Double(stepperCounter.text!) ?? 1.0
        
        // Calculate tip from subtotal bill amount
        let tip:Double = billAmount*(tipPerc[tipControl.selectedSegmentIndex]/100)
        
        // Calculate total bill
        var totalBillAmount:Double = tip+billAmount
        
        
        // Calculate split value if multiple people are present
        var splitBill:Double
        if roundBillSwitch.isOn{
            totalBillAmount = Darwin.ceil(totalBillAmount)
        }
        if personCount > 1 {
            splitBill = totalBillAmount/personCount
        } else {
            splitBill = totalBillAmount
        }
        

        
        // Update text labels with correct total
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", totalBillAmount)
        totalPerPerson.text = String(format:"$%.2f", splitBill)
        
        
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
    
    // When roundBill switch is toggled, it will update the total to the rounded amount
    @IBAction func roundBillChanged(_ sender: UISwitch) {
        updateBill()
    }
    
    func darkModeChecker() {
        if UserDefaults.standard.bool(forKey: "isDarkModeOn"){
            view.overrideUserInterfaceStyle = .dark
            
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
}

