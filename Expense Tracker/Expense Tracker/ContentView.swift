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
            Text("Recents")
                .tag(Tab.recents)
                .tabItem { Tab.recents.tabContent }
            Text("Search")
                .tag(Tab.search)
                .tabItem { Tab.search.tabContent }
            Text("Chart")
                .tag(Tab.charts)
                .tabItem { Tab.charts.tabContent }
            Text("Setting")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
