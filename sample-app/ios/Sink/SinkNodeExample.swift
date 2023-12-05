import SwitchboardSDK
import SwitchboardExampleDSP

class SinkNodeExample {
    let exampleSinkNode = SBExampleSinkNode()
    let audioGraph = SBAudioGraph()
    let audioEngine = SBAudioEngine()

    init() {
        audioGraph.addNode(exampleSinkNode)
        audioGraph.connect(audioGraph.inputNode, to: exampleSinkNode)
    }

    func start() {
        audioEngine.start(audioGraph)
    }

    func stop() {
        audioEngine.stop()
    }
}
