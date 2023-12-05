import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: SourceNodeExampleView()) {
                    Text("Example Source Node")
                }
                NavigationLink(destination: ProcessorNodeExampleView()) {
                    Text("Example Processor Node")
                }
                NavigationLink(destination: SinkNodeExampleView()) {
                    Text("Example Sink Node")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
