import SwiftUI

struct ProcessorNodeExampleView: View {

    var example = ProcessorNodeExample()

    var body: some View {
        VStack {
            Button("Start") {
                example.start()
            }
            Button("Stop") {
                example.stop()
            }
        }
    }
}
