import XCTest
@testable import LifoContainers

final class StackStatisticsMinimumElementTestCases: XCTestCase {
    private var stack = StackStatistics<Int>()

    override func setUp() {
        super.setUp()
        stack = .init()
    }

    func test_minimumElement_withEmptyStack_returnsNil() {
        // Given an empty stack

        // When, Then
        XCTAssertNil(stack.minimumElement())
    }

    func test_minimumElement_withNonEmptyStack_returnsMinimumOne() {
        // Given
        stack = StackStatistics<Int>([Int.min + 1, Int.min, Int.max])

        // When, Then
        XCTAssertEqual(stack.minimumElement(), Int.min)
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
