//
//  RequestManager.swift
//  ArticleNews
//
//  Created by Arilson Silva on 01/08/25.
//
import Foundation
struct RequestManager: RequestManaging {
    
    let session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func request <T: Decodable> (endpoint: Endpoint, completion: @escaping (Result<T, APIError>) -> Void ) {
        
        guard let url = URL(string: endpoint.fullUrl) else { return completion(.failure(APIError.invalidURL))}
        
        let task = session.dataTask(with: URLRequest.init(url: url)) { data, response, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed(error)))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            guard let jsonData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidResponse))
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: jsonData)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(.decodingFailed(error)))
            }
            
        }
        task.resume()
    }
    
}
