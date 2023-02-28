//
//  RequestManagerTests.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import XCTest
@testable import ProductsList

class RequestManagerTests: XCTestCase {
  private var requestManager: RequestManagerProtocol?

  override func setUp() {
    super.setUp()
    requestManager = RequestManagerMock(apiManager: APIManagerMock())
  }
    
    func testRequestProducts() async throws {
        guard let products: [Product] =
                   try await requestManager?.perform(ProductsRequestMock.getProducts) else { return }
        let first = products.first
        let last = products.last
        XCTAssertEqual(first?.id, "d366cc25-19f8-4e84-96a5-5d06f5e1a529")
        XCTAssertEqual(first?.name, "Product 1")
        XCTAssertEqual(first?.price, 9.99)
        XCTAssertEqual(first?.description, "This is the description for Product 1")
        XCTAssertEqual(first?.imageUrl, "https://picsum.photos/id/1000/600/400")
        
        XCTAssertEqual(last?.id, "08a9c5e5-afcb-45ab-9740-3f7e2ddbe8b2")
        XCTAssertEqual(last?.name, "Product 3")
        XCTAssertEqual(last?.price, 29.99)
        XCTAssertEqual(last?.description, "This is the description for Product 3")
        XCTAssertEqual(last?.imageUrl, "https://picsum.photos/id/1002/600/400")
    }
}
