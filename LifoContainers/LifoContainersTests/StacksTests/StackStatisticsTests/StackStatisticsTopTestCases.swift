import XCTest
@testable import LifoContainers

final class StackStatisticsTopTestCases: XCTestCase {
    private var stack: StackStatistics<Int>!

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
        stack = StackStatistics<Int>([1])
        let initialSizeOfStack = stack.count

        // When
        _ = stack.top()

        // Then
        XCTAssertEqual(initialSizeOfStack, stack.count)
    }

    func test_top_withNonEmptyStack_returnsLastAddedElement() {
        // Given
        let lastPushedElement = Int.min
        stack.push(lastPushedElement)

        // When
        let topElement = stack.top()

        // Then
        XCTAssertEqual(topElement, lastPushedElement)
    }
}
