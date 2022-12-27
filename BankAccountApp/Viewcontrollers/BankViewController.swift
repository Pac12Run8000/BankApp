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

        
        if updatedText.filter({ $0 == "." }).count > 1 {
           return false
        }
        
        let roundedValue = fetchSum(checkingValue: checkingTextField.text!, savingsValue: savingsTextField.text!).rounded(.awayFromZero)
        
        accountTotalLabel.text = " $\(roundedValue)"
        

        return true
        
    }
    
   
    
}


extension BankViewController {
    public func fetchSum(checkingValue:String, savingsValue:String) -> Double {
        let value1 = Double(checkingTextField.text ?? "0") ?? 0
        let value2 = Double(savingsTextField.text ?? "0") ?? 0
        return value1 + value2
    }
    
}

