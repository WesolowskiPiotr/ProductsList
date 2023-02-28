//
//  RepositoriesRequestMock.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation
@testable import ProductsList

enum ProductsRequestMock: RequestProtocol {
    case getProducts
    
    var requestType: RequestType {
        return .GET
    }
    
    var path: String {
        guard let path = Bundle.main.path(forResource: "Products", ofType: "json") else { return "" }
        return path
    }
}
