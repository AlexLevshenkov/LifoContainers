import LifoContainers
import XCTest

final class StackStatisticsGenericTypeTestCases: XCTestCase {
    func test_init_withDifferentTypes() {
        _ = StackStatistics<Int>()
        _ = StackStatistics<Double>()
        _ = StackStatistics<String>()
    }
}
