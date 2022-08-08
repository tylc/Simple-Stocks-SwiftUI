//
//  ContentView.swift
//  Simple Stocks
//
//  Created by Enric Herce on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var presentSheet = true
    @ObservedObject var stockListViewModel: StockListViewModel = StockListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(stockListViewModel.stockViewModels, id: \.self) { stockViewModel in
                        NavigationLink(value: stockViewModel) {
                            StockView(stockViewModel: stockViewModel)
                                .accessibilityIdentifier("StockView")
                        }
                    }
                }.searchable(text: $searchText)
            }
            .navigationTitle("Simple Stocks App")
            .navigationDestination(for: StockViewModel.self) { stockViewModel in
                StockView(stockViewModel: stockViewModel)
            }
            .sheet(isPresented: $presentSheet) {
                NewsArticleView()
                    .presentationDetents([.fraction(0.2), .medium, .large])
                    .accessibilityIdentifier("SheetNewsArticle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
