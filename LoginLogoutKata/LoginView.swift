//
//  LoginView.swift
//  LoginLogoutKata
//
//  Created by Antonio Calvo on 21/04/2017.
//  Copyright © 2017 EventMarketingExperience. All rights reserved.
//

import Foundation

protocol LoginView {
    var isLogInFormHidden: Bool { get set }
    var isLogInFormEnabled: Bool { get set }
    var isLogOutButtonHidden: Bool { get set }
    func resetLogInForm()
    func showError(message: String, completion: @escaping ()->())
}
