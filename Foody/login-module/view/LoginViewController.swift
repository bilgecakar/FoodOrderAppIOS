//
//  ViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 27.03.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var loginPresenterObject : ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
        
        LoginRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = ""
        
    }
    
    func updateUI()
    {
        //Username textfield UI
        emailTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        emailTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.cornerRadius = 5
        
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
    
    
    @IBAction func login(_ sender: Any) {
        
        let auth = Auth.auth()
        
        if let te = emailTextfield.text, let tp = passwordTextfield.text
        {
            loginPresenterObject?.loginAll(email: te, password: tp)
        }
        
        auth.addStateDidChangeListener(){ (auth,user) in
            if user != nil
            {
                print("start login success: " + (user?.email)! )
                self.performSegue(withIdentifier: "toHome", sender: nil)
                
            }else
            {
                print("No user is signed in.")
            }
            
            
            
        }
        
    }
    
}

