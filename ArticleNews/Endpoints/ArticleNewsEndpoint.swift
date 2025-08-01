//
//  ArticleNewsEndpoint.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//

import Foundation
enum ArticleNewsEndpoint: Endpoint {
    
    case fetch
    
    var path: String {
        switch self {
        case .fetch: "everything"
        }
    }
}
