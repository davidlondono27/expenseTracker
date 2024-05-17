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
                    Toggle(ConstantsText_ES.enableAppLock, isOn: $isAppLockEnabled)
                    if isAppLockEnabled {
                        Toggle(ConstantsText_ES.enableLockBack, isOn: $lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle(ConstantsText_ES.settings)
            .onTapGesture {
                hideKeyboard()
            }
        }.onTapGesture {
            hideKeyboard()
        }
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ContentView()
}
