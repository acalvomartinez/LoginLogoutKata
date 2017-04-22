////
////  LoginLogoutPresenterTests.swift
////  LoginLogoutKata
////
////  Created by Antonio Calvo on 21/04/2017.
////  Copyright © 2017 EventMarketingExperience. All rights reserved.
////
//
//import XCTest
//
//// TODO: Make mock login view
//
//class MockSessionAPIClient: SessionAPI {
//    var isLoginSuccess = false
//    var isLoginError = false
//    
//    override func login(email: String, pass: String, completion: LogInCompletionHandler) {
//        if isLoginSuccess {
//            completion.onLogInSuccess(email: email)
//        } else {
//            completion.onLogInError()
//        }
//    }
//    
//    override func logout(completion: LogOutCompletionHandler) {
//        if isLoginError {
//            completion.onLogOutSuccess()
//        } else {
//            completion.onLogOutError()
//        }
//    }
//}
//
//class FakeSessionStorage: SessionStorage {
//    var userEmail: String?
//    
//    func saveUser(email: String?) {
//        userEmail = email
//    }
//    
//    func getUser() -> String? {
//        return userEmail
//    }
//}
//
////class MockLoginView: LoginView {
////    
////    var isLogInFormHidden: Bool {
////        get {
////            return logInViewContainer.isHidden
////        }
////        set {
////            logInViewContainer.isHidden = newValue
////        }
////    }
////    
////    var isLogInFormEnabled: Bool {
////        get {
////            return loginButton.isEnabled
////        }
////        set {
////            loginButton.isEnabled = newValue
////            emailTextField.isEnabled = newValue
////            passTextField.isEnabled = newValue
////        }
////    }
////    
////    var isLogOutButtonHidden: Bool {
////        get {
////            return logoutButton.isHidden
////        }
////        set {
////            logoutButton.isHidden = newValue
////        }
////    }
////    
////    func showError(message: String, completion: @escaping ()->()) {
////        let alert = UIAlertController(title: "LoginKata", message: message, preferredStyle: .alert)
////        let alertAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
////        alert.addAction(alertAction)
////        
////        self.present(alert, animated: true) {
////            completion()
////        }
////    }
////    
////    func resetLogInForm() {
////        emailTextField.text = ""
////        passTextField.text = ""
////        loginButton.isEnabled = true
////    }
////}
//
//class LoginLogoutPresenterTests: XCTestCase {
//    
//    override func setUp() {
//        super.setUp()
//        let mockSessionAPI = MockSessionAPIClient(clock: MockClock())
//        let fakeSessionStorage = FakeSessionStorage()
//        
//        //presenter = LoginLogoutPresenter(sessionApiClient: mockSessionAPI, view: <#T##LoginView#>)
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//    
//}
