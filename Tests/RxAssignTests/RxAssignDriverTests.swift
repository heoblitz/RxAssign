//  MIT License
//
//  Copyright (c) 2021 Won Heo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  RxAssignDriverTests.swift
//  RxAssign
//
//  Created by won heo on 2021/12/02.
//

import XCTest

import RxCocoa
import RxSwift

@testable import RxAssign

final class RxAssignDriverTests: XCTestCase {
    var sut: Driver<String>!
    var disposeBag: DisposeBag!
    
    override func setUpWithError() throws {
        sut = Driver.of("work")
        disposeBag = DisposeBag()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        disposeBag = nil
    }
    
    func testAssign_withDriver() throws {
        // Given
        let testObject = TestObject()
        testObject.title = "not work"
        
        // When
        sut.assign(to: \.title, on: testObject)
            .disposed(by: disposeBag)
        
        // Then
        XCTAssertEqual(testObject.title, "work")
    }
}
