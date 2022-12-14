//
//  SettingsViewController.swift
//  Randomizer_sept2022
//
//  Created by Rose on 30.09.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var minimumValueTF: UITextField!
    @IBOutlet weak var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numbervalue = Int(newValue) else { return }
        if textField == minimumValueTF {
            randomNumber.minimumValue = numbervalue
        } else {
            randomNumber.maximumValue = numbervalue
        }
    }
}
