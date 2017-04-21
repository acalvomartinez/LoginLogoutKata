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
    var sessionStorage: SessionStorage
    
    init(sessionApiClient: SessionAPI, view: LoginView, sessionStorage: SessionStorage) {
        self.sessionApiClient = sessionApiClient
        self.view = view
        self.sessionStorage = sessionStorage
    }
    
    func viewDidLoad() {
        if (sessionStorage.getUser() != nil) {
            view.isLogOutButtonHidden = true
        } else {
            view.isLogInFormHidden = true
        }
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
            self.sessionStorage.saveUser(email: nil)
        }
    }
    
    func onLogInSuccess(email: String) {
        view.isLogOutButtonHidden = false
        view.isLogInFormHidden = true
        
        sessionStorage.saveUser(email: email)
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
        view.isLogInFormEnabled = true
        view.resetLogInForm()
    }
}
