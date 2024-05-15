import XCTest
@testable import LifoContainers

final class StackPopTestCases: XCTestCase {
    private var stack = Stack<String>()

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_pop_withEmptyStack_returnsNil() {
        // Given an empty stack

        // When, Then
        XCTAssertNil(stack.pop())
    }

    func test_pop_withNonEmptyStack_removesOnlyOneElement() {
        // Given
        stack = Stack<String>(["1"])
        let nonEmptyStackSizeBeforePop = stack.count

        // When
        stack.pop()

        // Then
        XCTAssertEqual(nonEmptyStackSizeBeforePop - stack.count, 1)
    }

    func test_pop_withNonEmptyStack_removesLastAddedElement() {
        // Given
        let lastPushedElement = "1"
        stack.push(lastPushedElement)

        // When, Then
        XCTAssertEqual(stack.pop(), lastPushedElement)
    }

    func test_pop_withNonEmptyStack_removesElementsAccordingToLifoRule() {
        // Given
        let pushedElements = ["1", "2", "3", "4"]
        stack = Stack<String>(pushedElements)

        // When
        var poppedElements = [String]()
        while let poppedElement = stack.pop() {
            poppedElements.append(poppedElement)
        }

        // Then
        XCTAssertEqual(poppedElements, Array(pushedElements.reversed()))
    }
}
