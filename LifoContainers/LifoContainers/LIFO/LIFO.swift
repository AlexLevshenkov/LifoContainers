//
//  LIFO.swift
//  LifoContainers
//
//  Created by Alex Levshenkov on 8.05.24.
//

/// The Last-In-First-Out (LIFO) protocol represents a data structure where elements are added and
/// removed in a specific order: **the last element that is added is the first one to be removed.**
///
/// The `LIFO` protocol provides a generic interface for implementing LIFO-based data structures.
/// It defines three operations:
///   - adding an element;
///   - popping the last added (top) element;
///   - retrieving the last added (top) element without removing it.
public protocol LIFO {
    /// The type of elements held in the LIFO data structure.
    associatedtype Element

    /// Adds a new element to the the LIFO data structure.
    /// - Parameter newElement: The element to be added to the LIFO data structure.
    mutating func push(_ newElement: Element)

    /// Removes and returns the last added element from the LIFO data structure.
    /// - Returns: The last added (top) element of the LIFO data structure.
    /// If LIFO is empty, returns `nil`.
    mutating func pop() -> Element?

    /// Returns the last added element from the LIFO data structure without removing it.
    /// - Returns: The last added (top) element of the LIFO data structure.
    /// If LIFO is empty, returns `nil`.
    func top() -> Element?
}
