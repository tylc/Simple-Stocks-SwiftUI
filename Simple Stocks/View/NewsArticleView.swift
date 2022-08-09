//
//  NewsArticleView.swift
//  Simple Stocks
//
//  Created by Enric Herce on 3/8/22.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {    
    @ObservedObject var newsArticlesViewModel: NewsArticleViewModel = NewsArticleViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(Strings.NewsArticleView.newsTitle)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text(Strings.NewsArticleView.newsSubtitle)
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
            }
            
            Spacer()
        }.padding().contentShape(Rectangle())
        List {
            ForEach(self.newsArticlesViewModel.articleList ?? [], id: \.self) { new in
                HStack {
                    VStack(alignment: .leading) {
                        Text(new.publication)
                            .font(.custom("Arial", size: 22))
                            .fontWeight(.bold)
                        
                        Text(new.title)
                            .font(.custom("Arial", size: 22))
                        
                        URLImage(newsArticlesViewModel.stringToURL(withString: new.imageUrlString)){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        return NewsArticleView()
    }
}
