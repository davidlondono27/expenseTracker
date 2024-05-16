//
//  ContentView.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFTU") private var isFTU: Bool = true
    @State private var activeTab: Tab = .recents
    var body: some View {
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
}

#Preview {
    ContentView()
}
