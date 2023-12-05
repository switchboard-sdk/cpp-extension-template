import SwiftUI

struct SinkNodeExampleView: View {

    var example = SinkNodeExample()

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
