//
//  SettingsViewController.swift
//  Prework
//
//  Created by Zach Fiorito on 7/20/21.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    
    var pickerOptions:[String] = [String]()
    var lowestTip = "15"
    var middleTip = "20"
    var highestTip = "25"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
        for n in 0...100 {
            pickerOptions.append("\(n)%")
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let width = pickerView.frame.size.width
        return (1 / 3.0) * width
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let userDefaults = UserDefaults.standard
        
        switch component {
        case 0:
            print("Setting lowTip to \(row.description) ")
            userDefaults.set(row.description, forKey: "lowTip")
        case 1:
            print("Setting midTip to \(row.description) ")
            userDefaults.set(row.description, forKey: "midTip")
        case 2:
            print("Setting highTip to \(row.description) ")
            userDefaults.set(row.description, forKey: "highTip")
        default:
            break
        }
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
