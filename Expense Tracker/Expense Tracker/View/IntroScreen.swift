//
//  IntroScreen.swift
//  Expense Tracker
//
//  Created by David Santiago Londono Giraldo on 17/12/23.
//

import SwiftUI

struct IntroScreen: View {
    @AppStorage("isFTU") private var isFTU: Bool = true
    //TODO: Make Multilanguage using Localizable Files
    var textConstants = ConstantsText_ES.self
    
    var body: some View {
        VStack(spacing: 15) {
            Text(textConstants.welcomeTextFTU)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            /// Points View
            VStack(alignment: .leading, spacing: 35) {
                PointView(symbol: "dollarsign", title: textConstants.transactionTitle, subTitle: textConstants.transactionSubTitle)
                PointView(symbol: "chart.bar.fill", title: textConstants.chartsTitle, subTitle: textConstants.chartsSubTitle)
                PointView(symbol: "magnifyingglass", title: textConstants.filterTitle, subTitle: textConstants.filterSubTitle)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 15)
            Spacer(minLength: 25)
            Button() {
                isFTU = false
            } label: {
                Text(textConstants.continueButton)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: RoundedRectangle(cornerRadius: 12))
                    .contentShape(Rectangle())
            }
        }
        .padding(15)
    }
    
    /// Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(subTitle)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}
