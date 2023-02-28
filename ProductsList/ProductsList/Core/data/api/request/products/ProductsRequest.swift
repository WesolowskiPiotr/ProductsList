//
//  ProductsRequest.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

enum ProductsRequest: RequestProtocol {
    case getProducts
    
    var path: String {
        "/v3/1c4cfa98-e329-4d49-8836-8ee195cec131"
    }
    
    var requestType: RequestType {
        .GET
    }
}
