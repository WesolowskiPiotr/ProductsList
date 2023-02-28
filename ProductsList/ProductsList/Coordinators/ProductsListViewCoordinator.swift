//
//  ProductsListViewCoordinator.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation
import SwiftUI

class ProductsListViewCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    @MainActor
    func start() {
        let view = ProductsListView(
            store: ProductsStore(),
            presenter: ProductsListPresenter(service: FetchProductsService(requestManager: RequestManager()))
        )
        rootViewController = UIHostingController(rootView: view)
    }
}
