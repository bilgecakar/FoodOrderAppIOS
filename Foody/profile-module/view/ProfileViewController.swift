//
//  ProfileViewController.swift
//  Foody
//
//  Created by Bilge Çakar on 2.04.2022.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController {
    
    @IBOutlet weak var settingTableview: UITableView!
    @IBOutlet weak var field: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    
    var settings = [Setting]()
    
    var profilePresenterObject : ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ProfileRouter.createModule(ref: self)
        
        settingTableview.delegate = self
        settingTableview.dataSource = self
        
        //Setting
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
        //White view UI
        field.layer.cornerRadius = 70
        field.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }
    
    
}

extension ProfileViewController : PresenterToViewProfileProtocol
{
    func sendDataToView(email: String) {
        
        self.emailLabel.text = email
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
        
        //Language
        if indexPath.row == 0
        {
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
        else //Log out
        {
            do { try Auth.auth().signOut() }
            catch { print("already logged out") }
            
            performSegue(withIdentifier: "toLogin", sender: nil)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
}
