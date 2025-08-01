//
//  Endpoint.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

protocol Endpoint {
    
    var path: String { get }
    var baseUrl: String { get }
    var fullUrl: String { get }
}

extension Endpoint {
    var baseUrl: String {
        return "https://newsapi.org/v2/"
    }
    
    var fullUrl: String {
        baseUrl + path
    }
}
