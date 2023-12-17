//
//  Recents.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI

struct Recents: View {
    @AppStorage("userName") private var userName: String = ""
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            Button {
                                
                            } label: {
                                Text("\(format(date: startDate, format: "dd - MMM yy")) \(ConstantsText_ES.toTextDivider) \(format(date: endDate, format: "dd - MMM yy"))")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                            .hSpacing(.leading)
                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(ConstantsText_ES.welcomeText)
                    .font(.title.bold())
                if !userName.isEmpty {
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer(minLength: 0)
            NavigationLink {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: Circle())
                    .contentShape(Circle())
            }
        }
        .padding(.bottom, userName.isEmpty ? 10 : 5)
            .background {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    Divider()
                }
                .padding(.horizontal, -15)
                .padding(.top, -(safeArea.top + 15))
            }
    }
}

struct Recents_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
