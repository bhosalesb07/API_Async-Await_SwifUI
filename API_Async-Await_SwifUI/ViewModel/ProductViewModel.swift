//
//  ProductViewModel.swift
//  ProductList+Async_AwaitAPICall
//
//  Created by Mac on 13/11/25.
//

import Foundation

@MainActor
class ProductViewModel:ObservableObject{
    
    @Published var products:[Product] = []
    
    private let manager = APIManager()
    
    func fetchProductData() async {
        do {
            products = try await manager.request(url: "https://fakestoreapi.com/products")
        }catch{
            print("Error:" ,error)
        }
    }
    
}
