import Testing

@Suite("Demo Failed Tests")
struct DemoFailedTests {
  
  @Test("Basic failing test")
  func basicFailingTest() {
    #expect(1 == 2, "Expected 1 to equal 2")
  }
  
  @Test("String comparison failure")
  func stringComparisonFailure() {
    let actual = "hello"
    let expected = "world"
    #expect(actual == expected, "Expected '\(actual)' to equal '\(expected)'")
  }
  
  @Test("Array comparison failure")
  func arrayComparisonFailure() {
    let actual = [1, 2, 3]
    let expected = [1, 2, 4]
    #expect(actual == expected, "Arrays should be equal")
  }
  
  @Test("Multiple expectations failure")
  func multipleExpectationsFailure() {
    let user = User(name: "John", age: 25)
    #expect(user.name == "Jane", "User name should be Jane")
    #expect(user.age == 30, "User age should be 30")
    #expect(user.isValid(), "User should be valid")
  }
  
  @Test("Complex object comparison")
  func complexObjectComparison() {
    let actual = Person(name: "Alice", details: PersonDetails(age: 25, city: "NYC"))
    let expected = Person(name: "Alice", details: PersonDetails(age: 30, city: "SF"))
    #expect(actual == expected, "Person objects should match")
  }
  
  @Test("Very long error message")
  func veryLongErrorMessage() {
    let actualMessage = "This is a very long error message that spans multiple lines and contains lots of detailed information about what went wrong in the test execution process"
    let expectedMessage = "This is a very different message that should cause a detailed comparison failure"
    #expect(actualMessage == expectedMessage, "This is also a very long custom message that explains in great detail why this particular test case is expected to fail and what the developer should look for when debugging this specific scenario")
  }
  
  @Test("Dictionary comparison failure")
  func dictionaryComparisonFailure() {
    let actual = ["name": "John", "age": "25", "city": "NYC"]
    let expected = ["name": "John", "age": "30", "city": "SF", "country": "USA"]
    #expect(actual == expected, "Dictionaries should contain the same key-value pairs")
  }
  
  @Test("Optional unwrapping failure")
  func optionalUnwrappingFailure() {
    let optionalValue: String? = nil
    #expect(optionalValue != nil, "Optional value should not be nil")
    #expect(optionalValue == "expected", "Optional should contain expected value")
  }
  
  @Test("Boolean logic failure")
  func booleanLogicFailure() {
    let isAuthenticated = false
    let hasPermission = true
    let isActive = false
    #expect(isAuthenticated && hasPermission && isActive, "All conditions should be true for access")
  }
  
  @Test("Numeric precision failure")
  func numericPrecisionFailure() {
    let actual = 3.14159265359
    let expected = 3.14159265358
    #expect(actual == expected, "Pi values should be exactly equal")
  }
  
  @Suite("Nested Suite with Complex Failures")
  struct NestedSuiteWithComplexFailures {
    
    @Test("Async operation simulation")
    func asyncOperationSimulation() {
      let result = simulateAsyncOperation()
      #expect(result.success == true, "Async operation should succeed")
      #expect(result.data.count > 0, "Result should contain data")
      #expect(result.errorMessage == nil, "No error message should be present")
    }
    
    @Test("State machine validation")
    func stateMachineValidation() {
      let stateMachine = StateMachine()
      stateMachine.transition(to: .processing)
      #expect(stateMachine.currentState == .completed, "State should be completed")
      #expect(stateMachine.isValid, "State machine should be in valid state")
    }
    
    @Test("Collection operations")
    func collectionOperations() {
      let numbers = [1, 2, 3, 4, 5]
      let filtered = numbers.filter { $0 % 2 == 0 }
      let mapped = filtered.map { $0 * 2 }
      
      #expect(filtered == [2, 4, 6], "Should filter even numbers correctly")
      #expect(mapped == [4, 8], "Should double the filtered numbers")
      #expect(mapped.reduce(0, +) == 20, "Sum should equal 20")
    }
    
    private func simulateAsyncOperation() -> (success: Bool, data: [String], errorMessage: String?) {
      return (success: false, data: [], errorMessage: "Network timeout")
    }
  }
}

// Helper types for testing
private struct User {
  let name: String
  let age: Int
  
  func isValid() -> Bool {
    return !name.isEmpty && age > 0
  }
}

private struct Person: Equatable {
  let name: String
  let details: PersonDetails
}

private struct PersonDetails: Equatable {
  let age: Int
  let city: String
}

private class StateMachine {
  enum State {
    case idle, processing, completed, error
  }
  
  private(set) var currentState: State = .idle
  
  func transition(to state: State) {
    currentState = state
  }
  
  var isValid: Bool {
    return currentState != .error
  }
} 