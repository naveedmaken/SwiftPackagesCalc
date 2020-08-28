//
//  ViewController.swift
//  firstCalculator
//
//  Created by Developer 1 on 28/08/2020.
//  Copyright © 2020 Developer 1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
      
      
      
      var shouldClearText = false
      
      var didTypeValue = false
      
    override func viewDidLoad() {
        super.viewDidLoad()
          textField.delegate = self
        // Do any additional setup after loading the view.
    }
     @IBAction func performOperation(_ sender: Any) {
            guard let button = sender as? UIButton else { return }
            
            showResult(self)
            
            switch button.tag {
            case 1: enumCalculation.shared.operation = .addition
            case 2: enumCalculation.shared.operation = .subtraction
            case 3: enumCalculation.shared.operation = .multiplication
            case 4: enumCalculation.shared.operation = .division
            default: break
            }

        }
        
        
        @IBAction func showResult(_ sender: Any) {
            if didTypeValue, let text = textField.text, text != "", let value = Double(text) {
                enumCalculation.shared.keep(value)
                enumCalculation.shared.calculateResult()
                shouldClearText = true
                didTypeValue = false
            }
            
            if let result = enumCalculation.shared.getFormattedResult() {
                textField.text = result
            }
        }


        @IBAction func clear(_ sender: Any) {
            textField.text = ""
            enumCalculation.shared.clear()
        }
    }



    extension ViewController: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if shouldClearText {
                textField.text = ""
                shouldClearText = false
            }
            
            didTypeValue = true
            
            return true
        }

}

