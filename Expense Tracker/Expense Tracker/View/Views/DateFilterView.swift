//
//  DateFilterView.swift
//  Expense Tracker
//
//  Created by David Londono on 15/05/24.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date
    var onSubmit: (Date, Date) -> ()
    var onClose: () -> ()
    var body: some View {
        VStack(spacing: 15) {
            DatePicker(ConstantsText_ES.startDate, selection: $start, displayedComponents: [.date])
            DatePicker(ConstantsText_ES.endDate, selection: $end, displayedComponents: [.date])
            
            HStack(spacing: 15) {
                Button(ConstantsText_ES.cancel) {
                    onClose()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.red)
                Button(ConstantsText_ES.filter) {
                    onSubmit(start, end)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(appTint)
            }
            .padding(.top, 10)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
    }
}
