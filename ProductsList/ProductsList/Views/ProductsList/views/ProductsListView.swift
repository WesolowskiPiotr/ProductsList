//
//  ProductsListView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct ProductsListView: View {
    @ObservedObject var store: ProductsStore
    @ObservedObject var monitor = NetworkMonitor()
    var presenter: ProductsListPresenter
    
    init(store: ProductsStore, presenter: ProductsListPresenter) {
        self.store = store
        self.presenter = presenter
        
        presenter.setViewDelegate(delegate: store)
    }
    
    var body: some View {
        NavigationView { () -> AnyView in
            switch store.state {
            case .loading:
                return AnyView(LoadingView())
            case .error:
                if !monitor.isConnected {
                    return AnyView(InternetConnectionView(fetchProducts: { await presenter.fetchProducts() }))
                } else {
                    return AnyView(ErrorView(fetchProducts: { await presenter.fetchProducts() }))
                }
            case .loaded(let products):
                if products.isEmpty {
                    return AnyView(EmptyListView())
                } else {
                    return AnyView(ProductsDisplayListView(
                        store: store,
                        products: products,
                        presenter: presenter))
                }
            }
        }
        .onAppear(perform: {
            Task {
                await presenter.fetchProducts()
            }
        })
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(
            store: ProductsStore(),
            presenter: ProductsListPresenter(
                service: FetchProductsService(
                    requestManager: RequestManager(
                    )
                )
            )
        )
    }
}
