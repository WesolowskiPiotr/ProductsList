//
//  ProductsListPresenter.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation

protocol ProductsServicesProtocol: AnyObject {
    func fetchProducts(request: RequestProtocol, completion: @escaping (Result<[Product], NetworkError>) -> Void) async
}

protocol ProductsPresenterProtocol: AnyObject {
    func fetchProducts() async
    func setViewDelegate(delegate: ProductsPresenterDelegate)
}

protocol ProductsPresenterDelegate: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(products: [Product])
}

final class ProductsListPresenter: ProductsPresenterProtocol {
    var service: ProductsServicesProtocol
    weak var delegate: ProductsPresenterDelegate?
    var products: [Product] = []

    init(service: ProductsServicesProtocol) {
        self.service = service
    }

    func fetchProducts() async {
        await service.fetchProducts(request: ProductsRequest.getProducts) { [weak self] result in
            switch result {
            case .failure(let error):
                guard let products = self?.products, products.count > 0 else {
                    self?.delegate?.render(errorMessage: error.localizedDescription)
                    return
                }
                self?.delegate?.render(products: products)
            case .success(let products):
                self?.products = products
                self?.delegate?.render(products: self?.products ?? [])
            }
        }
    }
    
    @MainActor
    func setViewDelegate(delegate: ProductsPresenterDelegate) {
        self.delegate = delegate
    }
}
