//
//  APIError.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//
enum APIError: Error {
    
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case serverError(String)
}
