//
//  NewsServiceProtocol.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

import Foundation

protocol NewsServiceProtocoling {
    func fetchEverything(category: String, completion: @escaping(Result<[Article], APIError>)-> Void)
}
