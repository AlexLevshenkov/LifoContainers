import XCTest
@testable import LifoContainers

final class StackStatisticsPopTestCases: XCTestCase {
    private var stack: StackStatistics<Int>!

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_pop_withEmptyStack_returnsNil() {
        // Given an empty stack

        // When
        let poppedElement = stack.pop()

        // Then
        XCTAssertNil(poppedElement)
    }

    func test_pop_withNonEmptyStack_removesOnlyOneElement() {
        // Given
        stack = StackStatistics<Int>([1])
        let initialSizeOfStack = stack.count

        // When
        stack.pop()

        // Then
        XCTAssertEqual(initialSizeOfStack - stack.count, 1)
    }

    func test_pop_withNonEmptyStack_removesLastAddedElement() {
        // Given
        let lastPushedElement = Int.max
        stack.push(lastPushedElement)

        // When
        let poppedElement = stack.pop()

        // Then
        XCTAssertEqual(poppedElement, lastPushedElement)
    }

    func test_pop_withNonEmptyStack_removesElementsAccordingToLifoRule() {
        // Given
        let pushedElements = [1, 2, 3, 4]
        var stack = StackStatistics<Int>(pushedElements)

        // When
        var poppedElements = [Int]()
        while let poppedElement = stack.pop() {
            poppedElements.append(poppedElement)
        }

        // Then
        XCTAssertEqual(poppedElements, Array(pushedElements.reversed()))
    }
}