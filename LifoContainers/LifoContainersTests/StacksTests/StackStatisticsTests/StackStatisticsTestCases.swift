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
}
