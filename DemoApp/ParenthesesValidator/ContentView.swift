import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Here you can check your string if parentheses in it are paired! Isn't it cool? 😉")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)

            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
