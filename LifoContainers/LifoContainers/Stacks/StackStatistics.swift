/// An abstract data type that serves as a collection of elements.
///
/// The `StackStatistics` is a specialized variation of the
/// [Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) data structure.
///
/// It is also a Last-In-First-Out (LIFO) data structure where elements are added
/// and removed from the top of it.
///
/// Besides standard LIFO behavior `StackStatistics` keeps the minimum stored element.
///
/// The `StackStatistics` holds elements of a single type, the stack’s `Element` type.
public struct StackStatistics<Element: Comparable>: LIFO {
    /// The underlying storage of the elements of the stack.
    private var elements: [Element]
    /// Keeps minimum elements in the stack.
    /// The current minimum is the element at the top of the stack.
    private var minimumElements = Stack<Element>()

    /// Creates a new instance of the `StackStatistics` with initial elements.
    /// - Parameter elements: Initial elements stored in the stack.
    /// **The last element of the `elements` is the top element of a new stack.**
    /// Defaults to an empty array.
    public init(_ elements: [Element] = []) {
        self.elements = []
        self.elements.reserveCapacity(elements.count)

        elements.forEach { push($0) }
    }

    /// The number of elements in the stack.
    public var count: Int { elements.count }

    /// Adds a new element to the stack.
    /// - Parameter newElement: The element to be added to the stack.
    /// - Complexity: O(1) on average, over many calls to `push(_:)` on the same stack.
    /// Worst case is O(`n`), where `n` is the number of elements in the stack.
    public mutating func push(_ newElement: Element) {
        elements.append(newElement)

        let currentMinimum = minimumElements.top() ?? newElement
        let newMinimum = min(newElement, currentMinimum)
        minimumElements.push(newMinimum)
    }

    /// Removes and returns the last added element from the stack.
    /// - Returns: The last added (top) element of the stack. If the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Element? {
        minimumElements.pop()
        return elements.popLast()
    }

    /// Returns the last added element from the stack without removing it.
    /// - Returns: The last added (top) element of the stack. If it is empty, returns `nil`.
    /// - Complexity: O(1)
    public func top() -> Element? {
        elements.last
    }

    /// Returns the minimum element in the stack.
    /// - Returns: The minimum element in the stack. If the stack has no elements, returns `nil`.
    ///
    /// - Note: If the stack contains several equal minimum elements
    /// function returns the later pushed element.
    ///
    /// - Complexity: O(1)
    public func minimumElement() -> Element? {
        minimumElements.top()
    }
}
