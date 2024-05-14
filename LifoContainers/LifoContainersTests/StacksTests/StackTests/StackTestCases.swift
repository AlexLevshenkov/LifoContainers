import XCTest
@testable import LifoContainers

final class StackTestCases: XCTestCase {
    private var stack: Stack<String>!

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_push_withEmptyStack_addsOnlyOneElement() {
        // Given
        let emptyStackSizeBeforePush = stack.count

        // When
        stack.push("1")

        // Then
        XCTAssertEqual(emptyStackSizeBeforePush, stack.count - 1)
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

        // When
        let poppedElement = stack.pop()

        // Then
        XCTAssertEqual(poppedElement, lastPushedElement)
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
