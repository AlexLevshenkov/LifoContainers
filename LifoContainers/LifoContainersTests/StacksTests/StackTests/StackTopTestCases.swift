import XCTest
@testable import LifoContainers

final class StackTopTestCases: XCTestCase {
    private var stack: Stack<String>!

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_top_withEmptyStack_returnsNil() {
        // Given an empty stack

        // When
        let topElement = stack.top()

        // Then
        XCTAssertNil(topElement)
    }

    func test_top_withNonEmptyStack_doesntRemoveElement() {
        // Given
        stack = Stack<String>(["1"])
        let nonEmptyStackSizeBeforeTop = stack.count

        // When
        _ = stack.top()

        // Then
        XCTAssertEqual(nonEmptyStackSizeBeforeTop, stack.count)
    }

    func test_top_withNonEmptyStack_returnsLastAddedElement() {
        // Given
        let lastPushedElement = "1"
        stack.push(lastPushedElement)

        // When
        let topElement = stack.top()

        // Then
        XCTAssertEqual(topElement, lastPushedElement)
    }
}
