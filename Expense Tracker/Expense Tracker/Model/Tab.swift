//
//  Tab.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI

enum Tab: String {
    case recents
    case search
    case charts
    case settings
    
    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .recents:
            Image(systemName: "calendar")
            Text(ConstantsText_ES.recentsText)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(ConstantsText_ES.filtersText)
        case .charts:
            Image(systemName: "chart.bar.xaxis")
            Text(ConstantsText_ES.chartsText)
        case .settings:
            Image(systemName: "gearshape")
            Text(ConstantsText_ES.settingsText)
        }
    }
}
