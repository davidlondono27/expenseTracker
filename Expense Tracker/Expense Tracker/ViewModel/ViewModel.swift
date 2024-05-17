//
//  ViewModel.swift
//  Expense Tracker
//
//  Created by David Londono on 15/05/24.
//

import Foundation
import LocalAuthentication

class ViewModel {
    var isUnlockApp: Bool = false
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock App"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    self.isUnlockApp = true
                } else {
                    //error
                }
            }
        } else {
            // No biometric
        }
    }
}

