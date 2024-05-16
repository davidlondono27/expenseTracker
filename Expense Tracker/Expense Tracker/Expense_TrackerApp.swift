//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Transaction.self ])
    }
}
