//
//  APIManager.swift
//  ProductList+Async_AwaitAPICall
//
//  Created by Mac on 13/11/25.
//

import Foundation
enum NetworkError:Error{
    case InvalidUrl
    case InvalidResponse
}


final class APIManager{
    
    func request<T:Decodable>(url:String) async throws -> T{
        
        guard let url = URL(string: url) else{
            throw NetworkError.InvalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            throw NetworkError.InvalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
