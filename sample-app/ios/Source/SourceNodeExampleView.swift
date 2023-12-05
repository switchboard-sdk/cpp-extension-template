import SwiftUI

struct SourceNodeExampleView: View {

    var example = SourceNodeExample()

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
