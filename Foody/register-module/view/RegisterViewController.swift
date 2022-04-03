//
//  RegisterViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    var registerRresneterObject : ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        RegisterRouter.createModule(ref: self)
        
    }
    
    func updateUI()
    {
        //Email Textfield UI
        emailTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        emailTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.cornerRadius = 5
        
        //Password Textfield UI
        passwordTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.cornerRadius = 5
        
        //SignIn Button UI
        signInButton.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func register(_ sender: Any) {
        
        if let te = emailTextfield.text, let tp = passwordTextfield.text
        {
            registerRresneterObject?.registerAll(email: te, password: tp)
        }
        
        let alert = UIAlertController(title: "WELCOME", message: "Thank you for signing up", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .default)
        {
            action in
            
            self.performSegue(withIdentifier: "toStart", sender: nil)
        }
        
        alert.addAction(okayAction)
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func returnLogin(_ sender: Any) {
       performSegue(withIdentifier: "toStart", sender: nil)
    }
    
}
