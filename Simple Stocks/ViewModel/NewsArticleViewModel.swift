//
//  NewsArticleViewModel.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import Foundation

class NewsArticleViewModel: ObservableObject {
    var getNews: GetNews
    @Published var articleList: [New]?
    
    init() {
        getNews = GetNews()
        fetchNews()
    }
    
    private func fetchNews() {
        getNews.getNews(completion: { value in
            DispatchQueue.main.async {
                self.articleList = value
            }
        }, errorCompletion: {_ in
            print("error, handle is a must. But we'll do it later")
        })
    }
    
    // MARK: StockListViewModelOutputs
    
    func numerOfItems() -> Int {
        return self.articleList?.count ?? 0
    }
}
