//
//  AddProductViewController.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/30/24.
//

import UIKit

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addProduct()
    }
    

    func addProduct(){
        guard let url=URL(string: "https://dummyjson.com/products/add")else{
            return
        }
        let params=AddProduct(title: "BMW")
        var request=URLRequest(url: url)
        request.httpMethod="POST"
        
        // model convert into data
        request.httpBody=try?JSONEncoder().encode(params)
        //header add
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else{
                return
            }
            do{
                let productReponse = try?JSONDecoder().decode(AddProduct.self, from: data)
                print(productReponse)
                
            }catch{
                print (error)
            }
        }.resume()
    }

}
