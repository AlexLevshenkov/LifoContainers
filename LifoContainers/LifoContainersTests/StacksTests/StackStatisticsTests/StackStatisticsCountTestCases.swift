import LifoContainers
import XCTest

final class StackStatisticsCountTestCases: XCTestCase {
    func test_count_withEmptyStack_returnsZero() {
        // Given
        let stack = StackStatistics<Int>()

        // When, Then
        XCTAssertEqual(stack.count, 0)
    }

    func test_count_withNonEmptyStack_returnsNumberOfStoredElements() {
        // Given
        let pushedElements = [1, 2, 3]
        let stack = StackStatistics(pushedElements)
        let expectedStackCount = pushedElements.count

        // When, Then
        XCTAssertEqual(stack.count, expectedStackCount)
    }
}
