import Foundation
import LifoContainers

// MARK: - ViewModel

final class ViewModel: ObservableObject {
    @Published var inputText = ""
    @Published private(set) var inputTextValidityState: TextValidityState = .unknown

    func validateButtonWasTapped() {
        inputTextValidityState = isTextValid(inputText) ? .valid : .invalid
    }

    func textWasChanged() {
        inputTextValidityState = .unknown
    }
}

// MARK: - Private methods

private extension ViewModel {
    func isTextValid(_ text: String) -> Bool {
        guard text.count > 1 else { return false }

        var stack = Stack<Character>()

        for letter in text {
            guard ["(", ")", "[", "]", "{", "}"].contains(letter) else { continue }

            switch letter {
            case "(":
                stack.push(")")
            case "{":
                stack.push("}")
            case "[":
                stack.push("]")

            default:
                if stack.count == 0 { return false }

                let lastChar = stack.pop()

                if letter != lastChar { return false }
            }
        }

        return stack.count == 0
    }
}

// MARK: - TextValidityState

extension ViewModel {
    enum TextValidityState {
        case valid
        case invalid
        case unknown
    }
}
