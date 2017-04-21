//
//  SessionApiClient.swift
//  LoginLogoutKata
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import Foundation

protocol LogInCompletionHandler {
    func onLogInSuccess()
    func onLogInError()
}

protocol LogOutCompletionHandler {
    func onLogOutSuccess()
    func onLogOutError()
}

class SessionAPI {
    func login(email: String, pass: String, completion: LogInCompletionHandler) {
        DispatchQueue.global(qos: .background).async {
            if (email == "toni") {
                DispatchQueue.main.async {
                    return completion.onLogInSuccess()
                }
            } else {
                DispatchQueue.main.async {
                    return completion.onLogInError()
                }
            }
        }
        
    }
    
    func logout(completion: LogOutCompletionHandler) {
        let time = Int(Date().timeIntervalSinceNow)
        return (time % 2 == 0) ? completion.onLogOutSuccess() : completion.onLogOutError()
    }
}
