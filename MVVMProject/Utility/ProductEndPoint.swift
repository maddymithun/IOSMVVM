//
//  ProductEndPoint.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/30/24.
//

import Foundation
enum EndPointsItems{
    case products
    case AddProduct(product:AddProduct)
}
extension EndPointsItems:EndPointType{
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        case .AddProduct(let product):
            return product
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeader
    }
    
    var path: String {
        switch self {
        case .products:
            return "products"
        case .AddProduct:
            return "products/add"
        }
    }
    var baseURL: String {
        switch self {
        case .products:
            return "https://fakestoreapi.com/"
        case .AddProduct:
            return "https://dummyjson.com/"
        }
        
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        case .AddProduct:
            return .post
        }
    }
}
