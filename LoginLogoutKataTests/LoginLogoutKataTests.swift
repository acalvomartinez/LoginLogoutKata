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

class MockLogOutCallback: LogOutCompletionHandler {
    var onSuccessInvoked = false
    var onErrorInvoked = false
    
    func onLogOutSuccess() {
        onSuccessInvoked = true
    }
    
    func onLogOutError() {
        onErrorInvoked = true
    }
}

class MockClock : Clock {
    var timeIntervalSinceNow: TimeInterval {
        return mockedTime
    }
    var mockedTime: TimeInterval = 0
}

class LoginLogoutKataTests: XCTestCase {
    
    func testLoginFailsIfTheUserIsEmpty() {
        let sessionAPI = SessionAPI.init(clock: MockClock())
        let mockLogInCompletion = MockLogInCallback()
        
        sessionAPI.login(email: "", pass: "1234", completion: mockLogInCompletion)
        
        expect(mockLogInCompletion.onErrorInvoked).toEventually(beTrue(), timeout: 3, pollInterval: 1, description: "No pass")
    }
    
    func testLoginFailsIfThePassIsEmpty() {
        let sessionAPI = SessionAPI.init(clock: MockClock())
        let mockLogInCompletion = MockLogInCallback()
        
        sessionAPI.login(email: "toni", pass: "", completion: mockLogInCompletion)
        
        expect(mockLogInCompletion.onErrorInvoked).toEventually(beTrue(), timeout: 3, pollInterval: 1, description: "No pass")
    }
    
    func testLoginPassIfTheUserAndPassAreCorrect() {
        let sessionAPI = SessionAPI.init(clock: MockClock())
        let mockLogInCompletion = MockLogInCallback()
        
        sessionAPI.login(email: "toni", pass: "1234", completion: mockLogInCompletion)
        
        expect(mockLogInCompletion.onSuccessInvoked).toEventually(beTrue(), timeout: 3, pollInterval: 1, description: "No pass")
    }

    
    func testLoginFailsIfTheUserAndPassAreEmpty() {
        let sessionAPI = SessionAPI.init(clock: MockClock())
        let mockLogInCompletion = MockLogInCallback()
        
        sessionAPI.login(email: "", pass: "", completion: mockLogInCompletion)
        
        expect(mockLogInCompletion.onErrorInvoked).toEventually(beTrue(), timeout: 3, pollInterval: 1, description: "No pass")
    }

    func testLogoutFailsIfTimeIsNotMultipleOf2() {
        let mockClock = MockClock()
        mockClock.mockedTime = 1
        
        let sessionAPI = SessionAPI.init(clock: mockClock)
        let mockLogOutCompletion = MockLogOutCallback()
        
        sessionAPI.logout(completion: mockLogOutCompletion)
        expect(mockLogOutCompletion.onErrorInvoked).toEventually(beTrue())
    }
    
    func testLogoutSuccesIfTimeIsMultipleOf2() {
        let mockClock = MockClock()
        mockClock.mockedTime = 2
        
        let sessionAPI = SessionAPI.init(clock: mockClock)
        let mockLogOutCompletion = MockLogOutCallback()
        
        sessionAPI.logout(completion: mockLogOutCompletion)
        expect(mockLogOutCompletion.onSuccessInvoked).toEventually(beTrue())
    }
}
