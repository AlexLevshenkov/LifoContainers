import XCTest
import LifoContainers

final class StackGenericTypeTestCases: XCTestCase {
    func test_init_withDifferentTypes() {
        _ = Stack<Int>()
        _ = Stack<Double>()
        _ = Stack<String>()
    }
}
