//
//  ProductsFetcherMock.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation
@testable import ProductsList

class ProductsFetcherMock {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension ProductsFetcherMock: ProductsServicesProtocol {
    func fetchProducts(request: RequestProtocol,
                           completion: @escaping (Result<[Product], NetworkError>) -> Void) async {
        let requestData = ProductsRequestMock.getProducts
        do {
        let products: [Product] = try await
            requestManager.perform(requestData)
            completion(.success(products))
        } catch {
            completion(.failure(.invalidServerResponse))
        }
    }
}
