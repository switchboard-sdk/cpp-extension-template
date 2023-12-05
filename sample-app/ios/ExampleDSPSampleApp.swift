import SwiftUI
import SwitchboardSDK

@main
struct ExampleDSPSampleApp: App {

    init() {
        SBSwitchboardSDK.initialize(withClientID: "", clientSecret: "")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
