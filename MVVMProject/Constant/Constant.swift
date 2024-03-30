//
//  Constant.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/26/24.
//

enum Constant {
    enum API{
        static let productURL = "https://fakestoreapi.com/products"
    }
    enum DataError:Error{
        case invalidResponse
        case invalidURL
        case invalidData
        case network(Error?)
    }
    enum Event{
        case loading
        case stopLoading
        case dateLoaded
        case error(_error:Error)
        case newProductAdd(product:AddProduct)
    }
}
