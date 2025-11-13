//
//  ProductRowView.swift
//  ProductList+Async_AwaitAPICall
//
//  Created by Mac on 13/11/25.
//

import Foundation
import SwiftUI



struct ProductRowView: View{
    var product:Product
    @State private var isBuyClicked = false
    var body: some View{
        HStack(spacing: 8){
            if let url = URL(string: product.image){
                AsyncImage(url: url) { image in
                    image
                    .resizable()
                    .scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(width: 100, height: 100)
            }
            VStack(alignment: .leading,spacing: 8){
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                HStack{
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                        Text(product.rating.rate.toString())
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.yellow)
                }
                Text(product.description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                HStack{
                    Text(product.price.currencyFormatter())
                        .font(.title3)
                        .foregroundColor(.indigo)
                    Spacer()
                    Button {
                        isBuyClicked = true
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .padding(.vertical,8)
                            .padding(.horizontal)
                            .background(.indigo)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .alert(product.title, isPresented: $isBuyClicked) {
            Button {
                
            } label: {
                Text("Ok")
            }

        } message: {
            Text(product.category)
        }

    }
}


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product.dummy)
    }
}
