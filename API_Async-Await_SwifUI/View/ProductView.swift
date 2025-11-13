//
//  ContentView.swift
//  ProductList+Async_AwaitAPICall
//
//  Created by Mac on 13/11/25.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var viewModel = ProductViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                List(viewModel.products){
                    product in
                    ProductRowView(product: product)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Products")
            .task {
                await viewModel.fetchProductData()
            }
        }
       
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
