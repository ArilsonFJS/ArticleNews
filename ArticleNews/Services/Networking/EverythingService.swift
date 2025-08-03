//
//  NewsService.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//
import Foundation
final class EverythingService: NewsServiceProtocoling {
    
    let requestManager: RequestManaging
    init(requestManager: RequestManaging) {
        self.requestManager = requestManager
    }
    
    func fetchEverything(category: String, completion: @escaping (Result<NewsResponse, APIError>) -> Void) {
        let articleEndpoint = ArticleNewsEndpoint.fetch
        requestManager.request(endpoint: articleEndpoint) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
