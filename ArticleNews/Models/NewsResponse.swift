//
//  NewsResponse.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

import Foundation
struct NewsResponse: Decodable {
    let articles: [Article]
}
