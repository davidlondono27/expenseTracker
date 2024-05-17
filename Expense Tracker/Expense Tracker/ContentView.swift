//
//  ContentView.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @AppStorage("isFTU") private var isFTU: Bool = true
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @State private var isUnlockApp: Bool = false
    @State private var activeTab: Tab = .recents
//    @State private var viewModel = ViewModel()
// TODO: Implementar el ViewModel, Background lock y Animation en LockView
    var body: some View {
        if isAppLockEnabled {
            if isUnlockApp {
                HomeApp()
            } else {
                //TODO: Mejorar UI de LockedView
                Button(ConstantsText_ES.unlockApp, action: authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .onAppear {
                        Task {
                            try? await Task.sleep(for: .seconds(0.75))
                            authenticate()
                        }
                    }
            }
        } else {
            HomeApp()
        }
        
        
        
    }
    
    @ViewBuilder
    func HomeApp() -> some View {
        TabView(selection: $activeTab) {
            Recents()
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            Search()
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            Graphs()
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            Settings()
                .tag(Tab.settings)
                .tabItem { Tab.settings.tabContent }
        }
        .tint(appTint)
        .sheet(isPresented: $isFTU) {
            IntroScreen()
                .interactiveDismissDisabled()
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = ConstantsText_ES.authenticateBiometric
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

#Preview {
    ContentView()
}
