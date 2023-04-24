//
//  HomeModel.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 16.04.2023.
//

import Foundation

// MARK: - Model
struct MyModel: Codable, HomeTableViewCellProtocol {
    
    let userID, id: Int
    let title, body: String
    
    var titleLbl: String {
        return title
    }
    var descLbl: String {
        return body
    }
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
