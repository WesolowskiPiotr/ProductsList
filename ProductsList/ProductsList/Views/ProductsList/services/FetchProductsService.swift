//
//  FetchProductsService.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation

@MainActor
class FetchProductsService {
    let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

// MARK: - ProductsFetcher
extension FetchProductsService: ProductsServicesProtocol {
    func fetchProducts(request: RequestProtocol,
                       completion: @escaping (Result<[Product], NetworkError>) -> Void) async {
        let requestData = request
        do {
            let products: [Product] = try await
            requestManager.perform(requestData)
            completion(.success(products))
        } catch {
            completion(.failure(.invalidServerResponse))
        }
    }
}
