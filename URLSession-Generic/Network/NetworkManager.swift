//
//  NetworkManager.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 15.04.2023.
//

import UIKit

struct NetworkManager {
    static let shared = NetworkManager()
    
    public func getTitleItem<T:Codable>(type: T.Type, completion: @escaping (Result<T,ErrorType>) -> Void) {
        
        guard let url = URL(string: "\(NetworkHelper.baseUrl)\(NetworkHelper.urlPath)") else {
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(.requestError))
            }
        }.resume()
    }
}
