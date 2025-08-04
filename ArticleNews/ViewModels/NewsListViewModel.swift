//
//  NewsListViewModel.swift
//  ArticleNews
//
//  Created by Arilson Silva on 03/08/25.
//

import Foundation
final class NewsListViewModel {
    
    private let newsService: NewsServiceProtocoling
    private var articles: [Article] = []
    
    var onNewUpdated: (() -> Void)?
    var onError: ((APIError) -> Void)?
    
    init(newService: NewsServiceProtocoling) {
        self.newsService = newService
    }
    
    func fetchEverything(category: String) {
        newsService.fetchEverything(category: category) { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.onNewUpdated?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}
