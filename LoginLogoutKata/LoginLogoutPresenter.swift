//
//  LoginLogoutPresenter.swift
//  LoginLogoutKata
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import Foundation

class LoginLogoutPresenter {
    var sessionApiClient: SessionAPI
    var view: LoginView
    
    init(sessionApiClient: SessionAPI, view: LoginView) {
        self.sessionApiClient = sessionApiClient
        self.view = view
    }
    
    func viewDidLoad() {
        view.isLogOutButtonHidden = true
    }
    
    func didPressLoginButton(email: String, pass: String) {
        self.view.isLogInFormEnabled = false;
        sessionApiClient.login(email: email, pass: pass, completion: self)
    }
    
    func didPressLogoutButton() {
        sessionApiClient.logout(completion: self)
    }
}

extension LoginLogoutPresenter: LogInCompletionHandler {
    func onLogInError() {
        view.showError(message: "You missed email or password. Try again.") {
            self.view.isLogInFormEnabled = true;
        }
    }
    
    func onLogInSuccess() {
        view.isLogOutButtonHidden = false
        view.isLogInFormHidden = true
    }
}

extension LoginLogoutPresenter: LogOutCompletionHandler {
    func onLogOutError() {
        view.showError(message: "No time for logout") {
            self.view.isLogOutButtonHidden = false
        }
    }
    
    func onLogOutSuccess() {
        view.isLogOutButtonHidden = true
        view.isLogInFormHidden = false
    }
}
