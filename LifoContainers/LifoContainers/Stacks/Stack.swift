//
//  Stack.swift
//  LifoContainers
//
//  Created by Alex Levshenkov on 8.05.24.
//

/// An abstract data type that serves as a collection of elements.
///
/// [Stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) is a Last-In-First-Out (LIFO)
/// data structure where elements are added and removed from the top of it.
///
/// The `Stack` holds elements of a single type, the stack’s `Element` type.
public struct Stack<Element>: LIFO {
    /// The underlying storage of the elements of the stack.
    private var elements: [Element]

    /// Creates a new instance of the stack with initial elements.
    /// - Parameter elements: Initial elements stored in the stack.
    /// **The last element of the `elements` is the top element of a new stack.**
    /// Defaults to an empty array.
    public init(_ elements: [Element] = []) {
        self.elements = elements
    }

    /// The number of elements in the stack.
    public var count: Int { elements.count }

    /// Adds a new element to the stack.
    /// - Parameter newElement: The element to be added to the stack.
    /// - Complexity: O(1) on average, over many calls to `push(_:)` on the same stack.
    /// Worst case is O(`n`), where `n` is the number of elements in the stack.
    public mutating func push(_ newElement: Element) {
        elements.append(newElement)
    }

    /// Removes and returns the last added element from the stack.
    /// - Returns: The last added (top) element of the stack. If the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    @discardableResult
    public mutating func pop() -> Element? {
        elements.popLast()
    }

    /// Returns the last added element from the stack without removing it.
    /// - Returns: The last added (top) element of the stack. If the stack is empty, returns `nil`.
    /// - Complexity: O(1)
    public func top() -> Element? {
        elements.last
    }
}
