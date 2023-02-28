//
//  RequestManagerMock.swift
//  ProductsListTests
//
//  Created by Piotr Wesołowski on 27/02/2023.
//

import XCTest
@testable import ProductsList

class RequestManagerMock: RequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    
    init(apiManager: APIManagerProtocol, parser: DataParserProtocol = DataParser()) {
        self.apiManager = apiManager
        self.parser = parser
    }
    
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        let data = try await apiManager.perform(request)
        let decoded: T = try parser.parse(data: data)
        return decoded
    }
}
