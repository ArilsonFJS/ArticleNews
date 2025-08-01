//
//  NewsService.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//
import Foundation
final class NewsService: NewsServiceProtocoling {
    
    let requestManager: RequestManager
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func fetchTopHeadlines(category: String, completion: @escaping (Result<[NewsResponse], APIError>) -> Void) {
        let articleEndpoint = ArticleNewsEndpoint.fetch
        requestManager.request(endpoint: articleEndpoint) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
