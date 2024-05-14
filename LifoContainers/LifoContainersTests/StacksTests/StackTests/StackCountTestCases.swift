import XCTest
@testable import LifoContainers

final class StackCountTestCases: XCTestCase {
    func test_count_withEmptyStack_returnsZero() {
        // Given
        let stack = Stack<String>()

        // When, Then
        XCTAssertEqual(stack.count, 0)
    }

    func test_count_withNonEmptyStack_returnsNumberOfStoredElements() {
        // Given
        let pushedElements = ["1", "2", "3"]
        let stack = Stack(pushedElements)
        let expectedStackCount = pushedElements.count

        // When, Then
        XCTAssertEqual(stack.count, expectedStackCount)
    }
}
