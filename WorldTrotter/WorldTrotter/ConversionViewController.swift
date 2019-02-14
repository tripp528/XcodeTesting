//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Tripp Gordon on 2/13/19.
//  Copyright © 2019 Tripp Gordon. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.maximumValue = 300
        slider.minimumValue = -300
    }
    
    @IBAction func fahrenheitFieldChange(_ textField: UITextField) {
        // initialize variables
        var inputString = "0"
        var farenheightVal : Double
        
        // unwrap input text into a string
        if let text = textField.text, !text.isEmpty {
            inputString = text
        }
        
        // unwrap the string into an integer
        if let stringInt = Double(inputString) {
            farenheightVal = stringInt
        } else {
            farenheightVal = 0
        }
        
        // calculate and return
        let celciusVal: Double = (farenheightVal - 32) * 5/9
        celciusLabel.text = String(format: "%.1f", celciusVal)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    @IBAction func slide(_ slider: UISlider) {
        textField.text = String(format: "%.1f", slider.value)
        fahrenheitFieldChange(textField)
    }
    
    //function to catch double decimal or letters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var onlyOneDecimal: Bool
        var onlyNums: Bool
        
        //check for decimals
        let existingTextHasDecimal = textField.text?.range(of: ".")
        let replacementTextHasDecimal = string.range(of: ".")
        if existingTextHasDecimal != nil,
            replacementTextHasDecimal != nil {
            onlyOneDecimal = false
            print("Too many Decimals")
        } else {
            onlyOneDecimal = true
        }
        
        //check for letters
        var acceptableChars = Set<String>()
        acceptableChars = ["0","1","2","3","4","5","6","7","8","9","."]
        if acceptableChars.contains(string) || Array(string).count == 0 {
            onlyNums = true
        } else {
            onlyNums = false
            print(string)
        }
        
        return onlyOneDecimal && onlyNums
    }
    
}
