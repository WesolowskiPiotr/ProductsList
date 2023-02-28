//
//  ProductsListPresenterTestCase.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import Foundation
import XCTest
@testable import ProductsList

@MainActor
final class ProductsListPresenterTestCase: XCTestCase {
    var presenter: ProductsListPresenter!
    var requestManager: RequestManagerMock?

    @MainActor
    override func setUp() {
        super.setUp()
        presenter = ProductsListPresenter(
            service: ProductsFetcherMock(
                requestManager: RequestManagerMock(
                    apiManager: APIManagerMock())))
    }

    override func tearDown() {
        presenter = nil
        requestManager = nil
        super.tearDown()
    }

    func testInitializedPresenter() {
        XCTAssertNotNil(presenter.service)
        XCTAssertNil(presenter.delegate)
        XCTAssertEqual(presenter.products, [])
    }
    
    func testSetViewDelegateNotNil() {
        // Given
        let store = ProductsStore()
        
        // When
        presenter.setViewDelegate(delegate: store)
        
        // Then
        XCTAssertNotNil(presenter.delegate, "Delegate not set")
    }
    
    func testFetchTransactionsProvideRepositoriesList() async {
        // When
        await presenter.fetchProducts()

        // Then
        XCTAssertTrue(!presenter.products.isEmpty, "Empty products list has been fetched, but it shoudn't.")
    }
}
