//
//  BottomTextFieldDelegate.swift
//  MemeMe
//
//  Created by Ransom Barber on 4/28/15.
//  Copyright (c) 2015 Hart Book. All rights reserved.
//

import Foundation
import UIKit

class BottomTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Clear default text.
        if textField.text == "BOTTOM" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Drop keyboard when Return is tapped.
        textField.resignFirstResponder()
        return true
    }
}
