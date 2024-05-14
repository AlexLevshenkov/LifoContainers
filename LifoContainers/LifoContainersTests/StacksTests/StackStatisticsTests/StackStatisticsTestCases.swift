import XCTest
@testable import LifoContainers

final class StackStatisticsTestCases: XCTestCase {
    private var stack: StackStatistics<Int>!

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_push_withEmptyStack_addsOneElement() {
        // Given
        let initialSizeOfStack = stack.count

        // When
        stack.push(1)

        // Then
        XCTAssertEqual(initialSizeOfStack, stack.count - 1)
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

    func test_minimumElement_withEmptyStack_returnsNil() {
        // Given an empty stack

        // When
        let minimumElement = stack.minimumElement()

        // Then
        XCTAssertNil(minimumElement)
    }

    func test_minimumElement_withNonEmptyStack_returnsMinimumOne() {
        // Given
        stack = StackStatistics<Int>([Int.min + 1, Int.min, Int.max])

        // When
        let minimumElement = stack.minimumElement()

        // Then
        XCTAssertEqual(minimumElement, Int.min)
    }

    func test_minimumElement_withSeveralMinimumElementsInStack_returnsLaterPushedOfThem() {
        struct Object: Comparable {
            let id: String
            let value: Int

            static func < (lhs: Object, rhs: Object) -> Bool {
                lhs.value < rhs.value
            }
        }

        // Given
        let objects: [Object] = [
            .init(id: "1", value: 99),
            .init(id: "2", value: 10),
            .init(id: "3", value: 10),
            .init(id: "4", value: 129),
        ]

        let stack = StackStatistics<Object>(objects)

        // When
        let minimumElement = stack.minimumElement()

        // Then
        XCTAssertEqual(minimumElement?.id, objects[2].id)
    }

    func test_minimumElement_afterPopMinElement_returnsNewMinimumOne() {
        struct Object: Comparable {
            let id: String
            let value: Int

            static func < (lhs: Object, rhs: Object) -> Bool {
                lhs.value < rhs.value
            }
        }

        // Given
        let objects: [Object] = [
            .init(id: "1", value: 15),
            .init(id: "2", value: 13),
            .init(id: "3", value: 13),
            .init(id: "4", value: 7),
        ]

        var stack = StackStatistics<Object>(objects)
        let initialMinimumElement = stack.minimumElement()
        stack.pop()

        // When
        let newMinimumElement = stack.minimumElement()

        // Then
        XCTAssertNotEqual(newMinimumElement?.id, initialMinimumElement?.id)
        XCTAssertEqual(newMinimumElement?.id, objects[2].id)
    }
}
