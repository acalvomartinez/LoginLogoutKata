//
//  SessionStorage.swift
//  LoginLogoutKata
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import Foundation

protocol SessionStorage {
    func saveUser(email: String?)
    func getUser() -> String?
}

class UserDefaultsSessionStorage: SessionStorage {
    func getUser() -> String? {
       return UserDefaults.standard.string(forKey: "usersession")
    }

    func saveUser(email: String?) {
        UserDefaults.standard.set(email, forKey: "usersession")
    }
}
