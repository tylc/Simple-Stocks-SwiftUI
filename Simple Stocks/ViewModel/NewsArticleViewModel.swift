//
//  NewsArticleViewModel.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import Foundation

protocol NewsArticleViewModelInputs {
    func stringToURL(withString string: String) -> URL
}

protocol NewsArticleViewModelOutputs {
    func numerOfItems() -> Int
}

class NewsArticleViewModel: NewsArticleViewModelOutputs, NewsArticleViewModelInputs, ObservableObject {
    var getNews: GetNews
    @Published var articleList: [New]?
    
    init() {
        getNews = GetNews()
        fetchNews()
    }
    
    private func fetchNews() {
        getNews.fetch(completion: { value in
            DispatchQueue.main.async {
                self.articleList = value as? [New]
            }
        }, errorCompletion: {_ in
            print("error, handle is a must. But we'll do it later")
        })
    }
    
    // MARK: NewsArticleViewModelInputs

    func stringToURL(withString urlString: String) -> URL {
        return URL(string: urlString)!
    }
    
    // MARK: NewsArticleViewModelOutputs
    
    func numerOfItems() -> Int {
        return self.articleList?.count ?? 0
    }
}
