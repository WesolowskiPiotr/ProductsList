//
//  ProductsDisplayListView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct ProductsDisplayListView: View {
    @ObservedObject var store: ProductsStore
    var products = [Product]()
    var presenter: ProductsListPresenter
    
    var body: some View {
        if #available(iOS 15.0, *) {
            List {
                ForEach(products, id: \.id) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        ProductRowView(product: product)
                    }
                }
            }
            .refreshable {
                Task {
                    store.state = .loading
                    await presenter.fetchProducts()
                }
            }
            .navigationBarItems(trailing: Button {
                Task {
                    store.state = .loading
                    await presenter.fetchProducts()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
                    .foregroundColor(.green)
            })
            .navigationTitle("Products-List-Title")
        } else {
            List {
                ForEach(products, id: \.id) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        ProductRowView(product: product)
                    }
                }
            }
            .navigationBarItems(trailing: Button {
                Task {
                    store.state = .loading
                    await presenter.fetchProducts()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .imageScale(.large)
                    .frame(minWidth: 40, minHeight: 40)
                    .foregroundColor(.green)
            })
            .navigationBarTitle("Products-List-Title")
        }
    }
}

struct ProductsDisplayListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsDisplayListView(
            store: ProductsStore(),
            presenter: ProductsListPresenter(
                service: FetchProductsService(
                    requestManager: RequestManager()
                )
            )
        )
    }
}
