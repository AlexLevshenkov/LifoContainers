import Foundation

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
        false
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
