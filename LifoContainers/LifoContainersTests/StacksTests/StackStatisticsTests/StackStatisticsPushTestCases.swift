import XCTest
@testable import LifoContainers

final class StackStatisticsPushTestCases: XCTestCase {
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

    func test_push_sameElements_addsAllElements() {
        // Given
        stack = StackStatistics<Int>([1, 2, 3, 4])
        let stackSizeBeforePush = stack.count
        let amountOfPushedElements = 5

        // When
        for _ in 1...amountOfPushedElements {
            stack.push(5)
        }
        let stackSizeAfterPush = stack.count

        // Then
        XCTAssertEqual(stackSizeAfterPush - amountOfPushedElements, stackSizeBeforePush)
    }
}
