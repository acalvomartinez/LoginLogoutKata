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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logInViewContainer: UIStackView!
    
    var isUserLogged: Bool = false;
    var presenter: LoginLogoutPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginLogoutPresenter(sessionApiClient: SessionAPI(clock: Date()), view: self, sessionStorage: UserDefaultsSessionStorage())
        presenter.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        presenter.didPressLoginButton(email: self.emailTextField.text!, pass: self.passTextField.text!)
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        presenter.didPressLogoutButton()
    }
}

extension Date: Clock { }

extension ViewController: LoginView {
    var isLogInFormHidden: Bool {
        get {
            return logInViewContainer.isHidden
        }
        set {
            logInViewContainer.isHidden = newValue
        }
    }
    
    var isLogInFormEnabled: Bool {
        get {
            return loginButton.isEnabled
        }
        set {
            loginButton.isEnabled = newValue
            emailTextField.isEnabled = newValue
            passTextField.isEnabled = newValue
        }
    }
    
    var isLogOutButtonHidden: Bool {
        get {
            return logoutButton.isHidden
        }
        set {
            logoutButton.isHidden = newValue
        }
    }
    
    func showError(message: String, completion: @escaping ()->()) {
        let alert = UIAlertController(title: "LoginKata", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true) {
            completion()
        }
    }
    
    func resetLogInForm() {
        emailTextField.text = ""
        passTextField.text = ""
        loginButton.isEnabled = true
    }
}


