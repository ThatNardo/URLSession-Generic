//
//  NetworkHelper.swift
//  URLSession-Generic
//
//  Created by Buğra Özuğurlu on 15.04.2023.
//

import UIKit

enum ErrorType: String,Error {
    case invalidData = "Invalid Data"
    case invalidUrl = "Invalid Url"
    case generalError = "General Error"
    case requestError = "Request Error"
}
struct NetworkHelper {
    static let shared = NetworkHelper()
    
    static let baseUrl = "https://jsonplaceholder.typicode.com"
    static let urlPath = "/posts"
}
