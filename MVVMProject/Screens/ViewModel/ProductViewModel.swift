//
//  ProductViewModel.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/27/24.
//

import Foundation
final class  ProductViewModel{
    var products:[Product]=[]
    var eventHnalder : ((_ event:Constant.Event) -> Void)?
    func fetchProduct(){
        self.eventHnalder?(.loading)
        APIManager.shared.request(modelType: [Product].self, type: EndPointsItems.products) { response in
            self.eventHnalder?(.stopLoading)
            switch response{
            case .success(let products):
                print(products)
                self.products=products
                self.eventHnalder?(.dateLoaded)
            case .failure(let error):
                print(error)
                self.eventHnalder?(.error(_error: error))
                
            }
        }
    }
    
    func addProduct(parameters:AddProduct){
        APIManager.shared.request(modelType: AddProduct.self //response type
                                  , type: EndPointsItems.AddProduct(product: parameters) //paramter/body value
        ) { result in
            
            switch result{
            case .success(let product):
                self.eventHnalder?(.newProductAdd(product: product))
                print("sucess product",product)
            case .failure(let error):
                self.eventHnalder?(.error(_error: error))
                print("sucess error",error)
            }
        }
        
        
    }
//    func fetchProductList(){
//        self.eventHnalder?(.loading)
//        APIManager.shared.fetchProducts { response in
//            self.eventHnalder?(.stopLoading)
//            switch response{
//            case .success(let products):
//                print(products)
//                self.products=products
//                self.eventHnalder?(.dateLoaded)
//            case .failure(let error):
//                print(error)
//                self.eventHnalder?(.error(_error: error))
//                
//            }
//        }
//    }
}
