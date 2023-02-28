//
//  ApplicationCoordinator.swift
//  ProductsList
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import SwiftUI

protocol Coordinator {
    func start()
}

class ApplicationCoordinator: Coordinator {
    let window: UIWindow

    var childCoordinators = [Coordinator]()
    init(window: UIWindow) {
        self.window = window
    }
    
    @MainActor
    func start() {
        let productsCoordinator = ProductsListViewCoordinator()
        productsCoordinator.start()
        self.childCoordinators.append(productsCoordinator)
        window.rootViewController = productsCoordinator.rootViewController
    }
}
