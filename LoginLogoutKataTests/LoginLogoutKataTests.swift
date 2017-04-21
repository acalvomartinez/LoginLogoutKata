//
//  LoginLogoutKataTests.swift
//  LoginLogoutKataTests
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import XCTest
import Nimble

@testable import LoginLogoutKata

class MockLogInCallback: LogInCompletionHandler {
    var onSuccessInvoked = false
    var onErrorInvoked = false
    
    func onLogInSuccess() {
        onSuccessInvoked = true
    }
    
    func onLogInError() {
        onErrorInvoked = true
    }
}

class LoginLogoutKataTests: XCTestCase {
    
    func testLoginFailsIfTheUserIsEmpty() {
        let sessionAPI = SessionAPI()
        let mockLogInCompletion = MockLogInCallback()
        
        sessionAPI.login(email: "", pass: "1234", completion: mockLogInCompletion)
        
        expect(mockLogInCompletion.onErrorInvoked).toEventually(beTrue())
    }
    
}
