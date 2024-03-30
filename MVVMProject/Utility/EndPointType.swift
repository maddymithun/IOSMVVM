//
//  EndPointType.swift
//  MVVMProject
//
//  Created by Mithun Chandra Dey on 3/29/24.
//

import Foundation
enum HTTPMethods:String{
    case get = "GET"
    case post="POST"
}
protocol EndPointType{
    var path:String { get }
    var baseURL:String { get }
    var url:URL? { get }
    var method:HTTPMethods { get }
    var body:Encodable?{get}
    var headers:[String:String]? {get}
}

    
    
    

