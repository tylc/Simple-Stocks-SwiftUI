//
//  ContentView.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var presentSheet = false
    @ObservedObject var stockListViewModel: StockListViewModel = StockListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(stockListViewModel.stockViewModels, id: \.self) { stockViewModel in
                        NavigationLink(value: stockViewModel) {
                            StockView(stockViewModel: stockViewModel)
                        }
                        .accessibilityIdentifier("StockView")
                    }
                }.searchable(text: $searchText)
                
                Spacer()
            }
            .navigationTitle(Strings.navigationTitle)
            .navigationDestination(for: StockViewModel.self) { stockViewModel in
                StockView(stockViewModel: stockViewModel)
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction, content:{
                    Button(action: {
                        presentSheet = true
                    }) {
                        Image(systemName: "newspaper")
                    }.accessibilityIdentifier("showButton")
                })
            }
            .sheet(isPresented: $presentSheet, onDismiss: { presentSheet = false }) {
                NewsArticleView()
                    .presentationDetents([.fraction(0.2), .medium, .large])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
