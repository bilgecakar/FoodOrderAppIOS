//
//  ViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI()
    {
        //Username textfield UI
        usernameTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        usernameTextfield.layer.borderWidth = 1.0
        usernameTextfield.layer.cornerRadius = 5
        
        //Password textfield UI
        passwordTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.cornerRadius = 5
        
        //Login Button UI
        loginButton.layer.cornerRadius = 5
        
    }


    @IBAction func signIn(_ sender: Any) {
        performSegue(withIdentifier: "toSignIn", sender: nil)
    }
    
}

