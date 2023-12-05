import SwitchboardSDK
import SwitchboardExampleDSP

class SourceNodeExample {
    let exampleSourceNode = SBExampleSourceNode()
    let monoToMultiChannelNode = SBMonoToMultiChannelNode()
    let audioGraph = SBAudioGraph()
    let audioEngine = SBAudioEngine()

    init() {
        audioGraph.addNode(exampleSourceNode)
        audioGraph.addNode(monoToMultiChannelNode)
        audioGraph.connect(exampleSourceNode, to: monoToMultiChannelNode)
        audioGraph.connect(monoToMultiChannelNode, to: audioGraph.outputNode)
    }

    func start() {
        audioEngine.start(audioGraph)
    }

    func stop() {
        audioEngine.stop()
    }
}
