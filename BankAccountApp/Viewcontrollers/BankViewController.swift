//
//  ViewController.swift
//  BankAccountApp
//
//  Created by Norbert Grover on 12/22/22.
//

import UIKit
import Combine

class BankViewController: UIViewController {
    
    @IBOutlet weak var accountTotalLabel: UILabel!
    @IBOutlet weak var checkingTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkingTextField.delegate = self
        savingsTextField.delegate = self
    }


}



// MARK:- This is the testfield delegte method that checks to make sure that
extension BankViewController:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let digitsAndPeriod = CharacterSet(charactersIn: "0123456789.")
        if string.rangeOfCharacter(from: digitsAndPeriod.inverted) != nil {
            return false
        }

        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        return fetchSum(updatedText: updatedText, checkingValue: checkingTextField.text ?? "", savingsValue: savingsTextField.text ?? "")
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if !(textField.text?.contains("."))! {
            print("Add a decimal point.")
            return false
        }
        return true
    }
    
}


extension BankViewController {
    
    private func fetchSum(updatedText:String, checkingValue:String, savingsValue:String) -> Bool {
        if updatedText.isEmpty || Double(updatedText) != nil {
            
            let value1 = Double(checkingTextField.text ?? "0") ?? 0
            let value2 = Double(savingsTextField.text ?? "0") ?? 0
            
            let total = value1 + value2
            accountTotalLabel.text = " $\(String(total))"
            
            return true
        } else {
            return false
        }
    }
}

