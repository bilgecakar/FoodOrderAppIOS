//
//  Person.swift
//  Foody
//
//  Created by Bilge Çakar on 31.03.2022.
//

import Foundation

class Person
{
    var username : String?
    var password : String?
    var email : String?
    
    init(username : String, email : String, password : String )
    {
        self.username = username
        self.email = email
        self.password = password
    }
}
