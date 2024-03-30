//
//  Product.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/26/24.
//

import Foundation
struct Product:Codable{
    var id          : Int?    = nil
    var title       : String? = nil
    var price       : Double? = nil
    var description : String? = nil
    var category    : String? = nil
    var image       : String? = nil
    var rating      : Rating? = Rating()
}


struct Rating: Codable {
    var rate  : Double? = nil
    var count : Int?    = nil
}
struct AddProduct:Codable{
    var  id:Int?=nil
    let title:String
}

