//
//  Settings.swift
//  Expense Tracker
//
//  Created by David Londono on 14/05/24.
//

import SwiftUI
import LocalAuthentication

struct Settings: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack {
            List {
                Section(ConstantsText_ES.userName) {
                    TextField(ConstantsText_ES.nameTip, text: $userName)
                }
                
                Section(ConstantsText_ES.appLock) {
                    Toggle("Enable App Lock", isOn: $isAppLockEnabled)
                    if isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
