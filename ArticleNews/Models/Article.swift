//
//  Article.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

import Foundation
struct Article: Decodable {
    
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
