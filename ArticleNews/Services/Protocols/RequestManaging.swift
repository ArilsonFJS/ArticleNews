//
//  RequestManaging.swift
//  ArticleNews
//
//  Created by Arilson Silva on 03/08/25.
//

import Foundation
protocol RequestManaging {
    func request <T: Decodable> (endpoint: Endpoint, completion: @escaping (Result<T, APIError>) -> Void )
}
