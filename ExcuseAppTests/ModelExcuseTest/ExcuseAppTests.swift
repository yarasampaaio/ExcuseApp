//
//  ExcuseAppTests.swift
//  ExcuseAppTests
//
//  Created by Yara Vitoria on 18/10/22.
//

import XCTest
@testable import ExcuseApp

final class ExcuseAppTests: XCTestCase {

    func test_excuseModelInit_validExcusedModel(){
        let excused: String = "I don't have a pink t-shirt"
        let category: String = "Unbeliavable"
        let sut = ExcuseModel (
        excuse: excused,
        category: category)
        
        XCTAssertEqual(sut.excuse, excused)
        XCTAssertEqual(sut.category, category)
    }

}
