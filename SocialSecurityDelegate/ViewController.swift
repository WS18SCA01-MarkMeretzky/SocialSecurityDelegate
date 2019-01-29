//
//  ViewController.swift
//  SocialSecurityDelegate
//
//  Created by Mark Meretzky on 1/27/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!;

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        textField.delegate = self;
    }
    
    //MARK: UITextFieldDelegate

    //The string argument is the character or characters the user wants to insert.
    //(It could be more than one character if the user is pasting text into the UITextField.)
    //Return true if all the characters in the string are digits.
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let set: Set<Character> = Set(string);
        let b: Bool =  set.isSubset(of: "0123456789");
        var substring: String = "";
        
        if let text: String = textField.text {
            let start: String.Index = text.index(text.startIndex, offsetBy: range.location); //Unit 2.1
            let end: String.Index = text.index(start, offsetBy: range.length);
            substring = String(text[start ..< end]);
        }

        print("Contains \"\(textField.text ?? "")\".  Change range \(range) (\"\(substring)\") to \"\(string)\": \(b)");
        return b;
    }
    
    //Called when return key is tapped.
    //Dismiss the keyboard of the UITextField contains exactly 9 characters.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text: String = textField.text,
            text.count == 9 {
            textField.resignFirstResponder();
        }
        return true;
    }
    
    //Called after keyboard is dismissed.
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text: String = textField.text {
            print("textFieldDidEndEditing: text = \"\(text)\"");
        }
    }

}

