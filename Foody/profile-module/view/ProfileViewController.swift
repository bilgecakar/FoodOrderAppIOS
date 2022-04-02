//
//  ProfileViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 2.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var settingTableview: UITableView!
    @IBOutlet weak var activeSwitch: UISwitch!
    @IBOutlet weak var field: UIView!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    
    var settings = [Setting]()
    
    var profilePresenterObject : ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileRouter.createModule(ref: self)
        
        settingTableview.delegate = self
        settingTableview.dataSource = self
        
        let settingItem1 = Setting(title: "Language")
        let settingItem2 = Setting(title: "Log Out")
        
        settings.append(settingItem1)
        settings.append(settingItem2)
        
        
        
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profilePresenterObject?.showInfoAll()
    }
    
    func updateUI()
    {
        emailTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        emailTextfield.layer.borderWidth = 1.0
        emailTextfield.layer.cornerRadius = 5
        
        passwordTextfield.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.cornerRadius = 5
        
        field.layer.cornerRadius = 70
        field.layer.maskedCorners = [.layerMinXMinYCorner]
        
        updateButton.layer.cornerRadius = 10
    }
    
    
}

extension ProfileViewController : PresenterToViewProfileProtocol
{
    func sendDataToView(email: String) {
        
        self.emailTextfield.text = email
    }
    
    
}


extension ProfileViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingArray = settings[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as! SettingTableViewCell
        
        cell.settingNameLabel.text = settingArray.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let alert = UIAlertController(title: "Language", message: "", preferredStyle: .actionSheet)
        
        let turkce = UIAlertAction(title: "Türkçe", style: .default) { action in
            print("Türkçe")
        }
        
        let english = UIAlertAction(title: "English", style: .default) { action in
          print("English")
        }
        
        alert.addAction(turkce)
        alert.addAction(english)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    
}

