//
//  APIManagerMock.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import XCTest
@testable import ProductsList

struct APIManagerMock: APIManagerProtocol {
  func perform(_ request: RequestProtocol) async throws -> Data {
      return try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
  }
}

