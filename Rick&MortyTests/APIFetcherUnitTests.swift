//
//  APIFetcherUnitTests.swift
//  Rick&MortyTests
//
//  Created by Default on 1/13/23.
//

import XCTest
@testable import Rick_Morty

final class APIFetcherUnitTests: XCTestCase {
    
    var sut: ApiFetcher!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ApiFetcher()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_ApiFetcher_DataIsFetched() throws {
        let expectation = XCTestExpectation(description: "Repositories Downloaded")
        sut.fetchCharactersFromApi()
        sut.$planets.sink { completion in
            debugPrint("Completed")
        } receiveValue: { planets in
            if !planets.isEmpty{
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
}
