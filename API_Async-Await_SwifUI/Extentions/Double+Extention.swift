//
//  Double+Extention.swift
//  ProductList+Async_AwaitAPICall
//
//  Created by Mac on 13/11/25.
//

import Foundation


extension Double{
    func toString() -> String{
        return String(format: "%0.1f", self)
    }
    
    func currencyFormatter() -> String{
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
