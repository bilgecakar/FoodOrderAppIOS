//
//  RegisterViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    
    }
    
    func updateUI()
    {
        //User Textfield UI
        usernameTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        usernameTextfield.layer.borderWidth = 1.0
        usernameTextfield.layer.cornerRadius = 5
        
        //User Textfield UI
        emailTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        emailTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.cornerRadius = 5
        
        //User Textfield UI
        passwordTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.cornerRadius = 5
        
        signInButton.layer.cornerRadius = 5
    }
    
    
}
