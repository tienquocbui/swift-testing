//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//

import Testing

/// Demo tests to showcase the failure summary feature in ConsoleOutputRecorder.
@Suite("Failure Summary Demo")
struct FailureSummaryDemoTests {
  
  @Test("Passing test")
  func passingTest() {
    #expect(1 + 1 == 2)
  }
  
  @Test("Simple failure")
  func simpleFailure() {
    let value = 5
    #expect(value == 10)  // This will fail
  }
  
  @Test("Multiple failures")
  func multipleFailures() {
    #expect(1 == 2)  // First failure
    #expect("hello" == "world")  // Second failure
    #expect([1, 2, 3].count == 5)  // Third failure
  }
  
  @Test("Array comparison failure")
  func arrayFailure() {
    let expected = [1, 2, 3, 4, 5]
    let actual = [1, 2, 3]
    #expect(actual == expected)
  }
  
  @Test("Another passing test")
  func anotherPassingTest() {
    #expect(true)
  }
  
  @Test("String comparison failure")
  func stringFailure() {
    let greeting = "Hello"
    #expect(greeting == "Goodbye")
  }
}

