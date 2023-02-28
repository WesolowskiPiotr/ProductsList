//
//  EmptyListView.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

struct EmptyListView: View {
    
    var body: some View {
        if #available(iOS 14.0, *) {
            List {}
            .navigationTitle("Products-List-Title")
        } else {
            List {}
            .navigationBarTitle("Products-List-Title")
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
