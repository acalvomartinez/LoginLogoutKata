//
//  ViewController.swift
//  LoginLogoutKata
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logInViewContainer: UIStackView!
    
    var isUserLogged: Bool = false;
    let sessionApiClient = SessionAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.isHidden = UserDefaults.standard.bool(forKey: "isLoggedUser")
        logInViewContainer.isHidden = !UserDefaults.standard.bool(forKey: "isLoggedUser")
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        sessionApiClient.login(email: self.emailTextField.text!, pass: self.passTextField.text!, completion: self)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        sessionApiClient.logout(completion: self)
    }
}

extension ViewController: LogInCompletionHandler {
    func onLogInError() {
        let alert = UIAlertController(title: "LoginLogOut", message: "Error", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "isLoggedUser")
        UserDefaults.standard.synchronize()
    }
    
    func onLogInSuccess() {
        logoutButton.isHidden = false
        logInViewContainer.isHidden = true
        UserDefaults.standard.set(true, forKey: "isLoggedUser")
        UserDefaults.standard.synchronize()
    }
}

extension ViewController: LogOutCompletionHandler {
    func onLogOutError() {
        logoutButton.isHidden = false
        
        UserDefaults.standard.set(true, forKey: "isLoggedUser")
        UserDefaults.standard.synchronize()
    }
    
    func onLogOutSuccess() {
        logoutButton.isHidden = true
        logInViewContainer.isHidden = false
        emailTextField.text = ""
        passTextField.text = ""
        UserDefaults.standard.set(false, forKey: "isLoggedUser")
        UserDefaults.standard.synchronize()
    }
}
