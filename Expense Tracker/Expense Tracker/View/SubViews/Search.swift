//
//  Search.swift
//  Expense Tracker
//
//  Created by David Londono on 14/05/24.
//

import SwiftUI
import Combine

struct Search: View {
    @State private var searchText: String = ""
    @State private var filterText: String = ""
    @State private var selectedCategory: Category? = nil
    let searchPublisher = PassthroughSubject<String, Never>()
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    FilterTransactionView(category: selectedCategory, searchText: filterText) { transactions in
                        ForEach(transactions) { transaction in
                            NavigationLink {
                                TransactionView(editTransaction: transaction)
                            } label: {
                                TransactionCardView(transaction: transaction, showsCategory: true)
                            }.buttonStyle(.plain)
                        }
                    }
                }
                .padding(15)
            }
            .overlay(content: {
                ContentUnavailableView(ConstantsText_ES.searchTransactions, systemImage: "magnifyingglass")
                    .opacity(filterText.isEmpty ? 1 : 0)
                    .onTapGesture {
                        hideKeyboard()
                    }
            })
            .onChange(of: searchText, { oldValue, newValue in
                if newValue.isEmpty {
                    filterText = ""
                }
                searchPublisher.send(newValue)
            })
            .onReceive(searchPublisher.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main), perform: { text in
                filterText = text
            })
            .searchable(text: $searchText)
            .navigationTitle(ConstantsText_ES.search)
            .background(.gray.opacity(0.15))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolBarContent()
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    @ViewBuilder
    func ToolBarContent() -> some View {
        Menu {
            Button {
                selectedCategory = nil
            } label: {
                HStack {
                    Text(ConstantsText_ES.both)
                    if selectedCategory == nil {
                        Image(systemName: "checkmark")
                    }
                }
            }
            ForEach(Category.allCases, id: \.rawValue) { category in
                Button {
                    selectedCategory = category
                } label: {
                    HStack {
                        Text(category.rawValue)
                        if selectedCategory == category {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            Image(systemName: "slider.vertical.3")
        }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    Search()
}
