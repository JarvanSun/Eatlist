//
//  LandingViewModelTests.swift
//  EatlistTests
//
//  Created by JarvanSun on 2022/11/23.
//

import XCTest
@testable import Eatlist

final class LandingViewModelTests: XCTestCase {
    func test_addButtonTapped() {
        // Given
        let subject = LandingViewModelImpl(resolver: LandingViewResolver())
        
        // When
        subject.addButtonTapped()
        
        // Then
        XCTAssertEqual(subject.itemToAdd.name, "")
        XCTAssertTrue(subject.isItemViewPresenting)
    }
    
    func test_cancelButtonTapped() {
        // Given
        let subject = LandingViewModelImpl(resolver: LandingViewResolver())
        subject.isItemViewPresenting = true
        
        // When
        subject.cancelButtonTapped()
        
        // Then
        XCTAssertFalse(subject.isItemViewPresenting)
    }
    
    func test_commit() {
        // Given
        let subject = LandingViewModelImpl(resolver: LandingViewResolver())
        subject.isItemViewPresenting = true
        
        // When
        subject.commit()
        
        // Then
        XCTAssertFalse(subject.isItemViewPresenting)
    }
}
