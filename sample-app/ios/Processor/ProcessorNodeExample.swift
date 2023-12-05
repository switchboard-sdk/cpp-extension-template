import SwitchboardSDK
import SwitchboardExampleDSP

class ProcessorNodeExample {
    let sineNode = SBSineGeneratorNode()
    let exampleProcessorNode = SBExampleProcessorNode()
    let monoToMultiChannelNode = SBMonoToMultiChannelNode()
    let audioGraph = SBAudioGraph()
    let audioEngine = SBAudioEngine()

    init() {
        audioGraph.addNode(sineNode)
        audioGraph.addNode(exampleProcessorNode)
        audioGraph.addNode(monoToMultiChannelNode)
        audioGraph.connect(sineNode, to: exampleProcessorNode)
        audioGraph.connect(exampleProcessorNode, to: monoToMultiChannelNode)
        audioGraph.connect(monoToMultiChannelNode, to: audioGraph.outputNode)
    }

    func start() {
        audioEngine.start(audioGraph)
    }

    func stop() {
        audioEngine.stop()
    }
}
