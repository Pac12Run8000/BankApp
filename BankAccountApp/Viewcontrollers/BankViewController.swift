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
   
    private var cancellables = Set<AnyCancellable>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checkingTextField.delegate = self
        savingsTextField.delegate = self
        
    }


}

extension BankViewController:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let checkingValue = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if (Double(checkingValue) == nil) {
            return false
        } else {
            return true
        }
        
    }
    
}

