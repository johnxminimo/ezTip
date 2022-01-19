//
//  SettingsViewController.swift
//  Prework
//
//  Created by John Minimo on 1/11/22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var customTipTwo: UITextField!
    @IBOutlet weak var customTipOne: UITextField!
    @IBOutlet weak var customTipThree: UITextField!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    var darkModeState:Bool = false
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Settings"
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTipPercPlaceHolder()
    }
    
    // Updates Custom Tips UITextFields placeholder text with appropriate saved value from previous use
    func updateTipPercPlaceHolder() {
        let custTipValOne = defaults.double(forKey: "CustomTipValueOne")
        customTipOne.placeholder = String(format: "%.0f%%", custTipValOne)
        let custTipValTwo = defaults.double(forKey: "CustomTipValueTwo")
        customTipTwo.placeholder = String(format: "%.0f%%", custTipValTwo)
        let custTipValThree = defaults.double(forKey: "CustomTipValueThree")
        customTipThree.placeholder = String(format: "%.0f%%", custTipValThree)
    }
    

    // When first custom tip field is changed, value is saved
    @IBAction func customTipOneChanged(_ sender: UITextField) {
        let customTipOneVar = Double(customTipOne.text!) ?? 0.0
        defaults.set(customTipOneVar, forKey:"CustomTipValueOne")
        updateTipPercPlaceHolder()
        
    }
    // When second custom tip field is changed, value is saved
    @IBAction func customTipTwoChanged(_ sender: UITextField) {
        let customTipTwoVar = Double(customTipTwo.text!) ?? 0.0
        defaults.set(customTipTwoVar, forKey:"CustomTipValueTwo")
        updateTipPercPlaceHolder()
        
        
    }
    
    // When third custom tip field is changed, value is saved
    @IBAction func customTipThreeChanged(_ sender: UITextField) {
        let customTipThreeVar = Double(customTipThree.text!) ?? 0.0
        defaults.set(customTipThreeVar, forKey:"CustomTipValueThree")
        updateTipPercPlaceHolder()
    }
    
    // WIP still need to figure this out
    @IBAction func darkModeSwitchChanged(_ sender: UISwitch) {

        UserDefaults.standard.set(darkModeSwitch.isOn, forKey:"isDarkMode")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
