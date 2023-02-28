//
//  InternetConnectionView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct InternetConnectionView: View {
    @ObservedObject var monitor = NetworkMonitor()
    @State private var showAlertSheet = false
    var fetchProducts: () async -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .font(.system(size: 56))
            Text("Not-Connected-Text")
                .padding()
            Button("Perform-Network-Request") {
                self.showAlertSheet = true
            }
        }
        .alert(isPresented: $showAlertSheet, content: {
            if monitor.isConnected {
                Task {
                    await fetchProducts()
                }
            }
            return Alert(title: Text("Not-Connected-Alert-Title"),
                         message: Text("Not-Connected-Alert-Message"),
                         dismissButton: .default(Text("Not-Connected-Alert-Button-Text")))
        })
    }
}
