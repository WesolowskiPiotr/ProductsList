//
//  ErrorView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct ErrorView: View {
    var fetchProducts: () async -> Void
    
    var body: some View {
        if #available(iOS 15.0, *) {
            List {
                VStack(alignment: .center) {
                    Spacer()
                    Text("Empty-Products-List-Message")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Empty-Products-List-Submessage")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(5)
                    Spacer()
                        .frame(height: 50)
                    Button("Fetch-Products-Again") {
                        Task {
                            await fetchProducts()
                        }
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(.green)
                    .font(.title2)
                    .border(.green)
                    Spacer()
                }
            }
            .navigationTitle("Products-List-Title")
        } else {
            List {
                VStack(alignment: .center) {
                    Spacer()
                    Text("Empty-Products-List-Message")
                        .font(.system(size: 16, weight: .bold))
                    Text("Empty-Products-List-Submessage")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(5)
                    Spacer()
                    Button("Fetch-Products-Again") {
                        Task {
                            await fetchProducts()
                        }
                    }
                    .frame(width: 300, height: 40)
                    .foregroundColor(.green)
                    .font(.system(size: 16, weight: .bold))
                    .border(.green)
                    Spacer()
                }
            }
            .navigationBarTitle("Products-List-Title")
        }
    }
}
