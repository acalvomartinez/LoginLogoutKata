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

protocol Clock {
    var timeIntervalSinceNow: TimeInterval { get }
}

class SessionAPI {
    
    let clock: Clock
    
    init(clock: Clock) {
        self.clock = clock
    }
    
    func login(email: String, pass: String, completion: LogInCompletionHandler) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime.now() + 1) {
            if (email == "toni" && pass == "1234") {
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
        let time = Int(clock.timeIntervalSinceNow)
        return (time % 2 == 0) ? completion.onLogOutSuccess() : completion.onLogOutError()
    }
}
