//
//  ProductDetailsView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: product.imageUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 60, maxHeight: 60)
                                    .clipShape(Circle())
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .bold()
                                .font(.title2)
                                .lineLimit(1)
                                .frame(alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Text(String(product.price))
                                .font(.headline)
                                .foregroundColor(.green)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                            Text(product.description)
                                .font(.title3)
                        Spacer()
                    }
                }
                .frame(height: 70)
                Spacer()
            }
            .navigationTitle("Products-Details-Title")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            VStack {
                HStack {
                    VStack {
                        Image(uiImage: product.imageUrl.load())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 60, maxHeight: 60)
                            .clipShape(Circle())
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .bold()
                                .font(.system(size: 13))
                                .lineLimit(1)
                                .frame(alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(String(product.price))
                                .font(.headline)
                                .foregroundColor(.green)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                                .fixedSize(horizontal: true, vertical: false)
                        }
                        Text(product.description)
                            .font(.system(size: 13))
                        Spacer()
                    }
                }
                .frame(height: 70)
                Spacer()
            }
            .navigationBarTitle("Products-Details-Title", displayMode: .inline)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: Product.example)
    }
}
