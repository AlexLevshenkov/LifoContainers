import LifoContainers
import XCTest

final class StackPushTestCases: XCTestCase {
    private var stack = Stack<String>()

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

    func test_push_sameElements_addsAllElements() {
        // Given
        stack = Stack<String>(["1", "2", "3", "4"])
        let stackSizeBeforePush = stack.count
        let amountOfPushedElements = 5

        // When
        for _ in 1...amountOfPushedElements {
            stack.push("5")
        }
        let stackSizeAfterPush = stack.count

        // Then
        XCTAssertEqual(stackSizeAfterPush - amountOfPushedElements, stackSizeBeforePush)
    }
}
