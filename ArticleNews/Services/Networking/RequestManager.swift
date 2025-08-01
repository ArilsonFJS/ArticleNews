//
//  RequestManager.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//
import Foundation
struct RequestManager {
    
    let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request <T: Decodable> (endpoint: Endpoint, completion: @escaping (Result<T, APIError>) -> Void ) {
        
        guard let url = URL(string: endpoint.fullUrl) else { return completion(.failure(APIError.invalidURL))}
        
        let task = session.dataTask(with: URLRequest.init(url: url)) { data, response, error in
            guard let jsonData = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([NewsResponse].self, from: jsonData)
                completion(.success(decoded as! T))
            } catch let error {
                completion(.failure(error as! APIError))
            }
            
        }
        task.resume()
    }
    
}
