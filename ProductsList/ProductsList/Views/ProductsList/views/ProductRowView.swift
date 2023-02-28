//
//  ProductRowView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct ProductRowView: View {
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
                        Text(product.name)
                            .bold()
                            .font(.title2)
                            .lineLimit(1)
                            .frame(alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(String(product.price))
                            .font(.headline)
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .fixedSize(horizontal: true, vertical: false)
                        Spacer()
                    }
                }
                .frame(height: 70)
            }
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
                    Spacer()
                }
                .frame(height: 70)
            }
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product.example)
    }
}
