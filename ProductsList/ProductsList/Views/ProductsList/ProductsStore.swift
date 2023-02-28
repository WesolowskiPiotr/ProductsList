//
//  ProductsStore.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Combine

@MainActor
final class ProductsStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(products: [Product])
    }
    
    @Published var state: State = .loading
}

extension ProductsStore: ProductsPresenterDelegate {
    func render(errorMessage: String) {
        state = .error(message: errorMessage)
    }
    func renderLoading() {
        state = .loading
    }
    
    func render(products: [Product]) {
        state = .loaded(products: products)
    }
}
