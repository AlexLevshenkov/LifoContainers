import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State private var inputText = ""
    @State private var inputTextValidityState: TextValidityState = .unknown

    var body: some View {
        VStack {
            Text("Here you can check your string if parentheses in it are paired! Isn't it cool? 😉")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            Spacer()

            TextField("Try it out!", text: $inputText)
                .textFieldStyle(.roundedBorder)

            Spacer()
        }
        .padding()
    }
}

// MARK: - TextValidityState

private extension ContentView {
    enum TextValidityState {
        case valid
        case invalid
        case unknown
    }
}

// MARK: - Private methods

private extension ContentView {
    func isTextValid(_ text: String) -> Bool {
        false
    }

    func borderColor(for textValidityState: TextValidityState) -> Color {
        switch textValidityState {
        case .valid: .green
        case .invalid: .red
        case .unknown: .clear
        }
    }

    func buttonTitle(for textValidityState: TextValidityState) -> String {
        switch textValidityState {
        case .valid: "All parentheses are paired!"
        case .invalid: "Something wrong with your string"
        case .unknown: "Validate"
        }
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
