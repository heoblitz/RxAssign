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
//  RxAssign.swift
//  RxAssign
//
//  Created by won heo on 2021/12/02.
//

import Foundation

import RxCocoa
import RxSwift

private let errorMessage = "`drive*` family of methods can be only called from `MainThread`.\n" +
"This is required to ensure that the last replayed `Driver` element is delivered on `MainThread`.\n"

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    public func assign<Root: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<Root, Element>,
        on object: Root
    ) -> Disposable {
        MainScheduler.ensureRunningOnMainThread(errorMessage: errorMessage)
        return self.asSharedSequence()
                   .asObservable()
                   .subscribe { [weak object] (e: Element) in
                       guard let object = object else { return }
                       object[keyPath: keyPath] = e
                   }
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy {
    public func assign<Root: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<Root, Element>,
        on object: Root
    ) -> Disposable {
        MainScheduler.ensureRunningOnMainThread(errorMessage: errorMessage)
        return self.asSharedSequence()
                   .asObservable()
                   .subscribe { [weak object] (e: Element) in
                       guard let object = object else { return }
                       object[keyPath: keyPath] = e
                   }
    }
}
