//
//  ViewController.swift
//  Prework
//
//  Created by Zach Fiorito on 7/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages:[Double] = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        self.billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        self.tipControl.selectedSegmentIndex = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Grab our user specified default values for the SegmentedControl titles
        let tipValues = UserDefaults.standard
        tipControl.setTitle(tipValues.string(forKey: "lowTip"), forSegmentAt: 0)
        tipControl.setTitle(tipValues.string(forKey: "midTip"), forSegmentAt: 1)
        tipControl.setTitle(tipValues.string(forKey: "highTip"), forSegmentAt: 2)
        
        tipPercentages = [percentToDouble(string: tipValues.string(forKey: "lowTip")!), percentToDouble(string: tipValues.string(forKey: "midTip")!), percentToDouble(string: tipValues.string(forKey: "highTip")!)]
        
        print(tipPercentages)
    }

    @IBAction func billAmountEntered(_ sender: Any) {
        calculateTip()
    }
   
    @IBAction func tipSelected(_ sender: Any) {
        calculateTip()
    }
    
    func calculateTip() {
        print("Calculating tip the tip for a \(billAmountTextField.text) bill")
        let bill = Double(billAmountTextField.text!) ?? 0.0
        
        print("Tip multiplier: \(tipPercentages[tipControl.selectedSegmentIndex])")
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        print("Tip: \(tip), Total: \(total)")
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    /*
     Doesn't stip the percent sign specifically, but all input data is provided
     by me, so it should be alright
     */
    func percentToDouble(string: String) -> Double {
        let percent =  "." + String(string.dropLast())
        
        return Double(percent) ?? 0.15
    }
    
}

