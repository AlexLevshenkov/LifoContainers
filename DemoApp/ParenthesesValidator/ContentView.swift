import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            Text("Here you can check your string if parentheses in it are paired! Isn't it cool? 😉")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            Spacer()

            TextField("Try it out!", text: $viewModel.inputText)
                .textFieldStyle(.roundedBorder)

            Spacer()

            Button(action: {
                viewModel.validateButtonWasTapped()
            }, label: {
                Text(buttonTitle(for: viewModel.inputTextValidityState))
            })
            // swiftlint:disable no_magic_numbers
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(borderColor(for: viewModel.inputTextValidityState))
            )
            // swiftlint:enable no_magic_numbers
            .disabled(viewModel.inputText.isEmpty)
            .onReceive(viewModel.$inputText, perform: { _ in
                viewModel.textWasChanged()
            })
        }
        .padding()
    }
}

// MARK: - Private methods

private extension ContentView {
    func borderColor(for textValidityState: ViewModel.TextValidityState) -> Color {
        switch textValidityState {
        case .valid: .green
        case .invalid: .red
        case .unknown: .clear
        }
    }

    func buttonTitle(for textValidityState: ViewModel.TextValidityState) -> String {
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
