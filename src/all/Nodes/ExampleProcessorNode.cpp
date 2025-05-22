#include "ExampleProcessorNode.hpp"
#include <switchboard_v2/FloatPointerParameter.hpp>

namespace switchboard::extensions::exampledsp {

ExampleProcessorNode::ExampleProcessorNode() : gain {1.0f} {
    type = "ExampleProcessorNode";
    createParameters();
}

void ExampleProcessorNode::createParameters() {
    parameters.push_back(std::make_unique<FloatPointerParameter>(
        "gain",
        "Gain",
        "The gain of the processor.",
        &gain,
        0.0f,
        1.0f
    ));
}

bool ExampleProcessorNode::setBusFormat(AudioBusFormat& inputBusFormat, AudioBusFormat& outputBusFormat) {
    return AudioBusFormat::matchBusFormats(inputBusFormat, outputBusFormat);
};

bool ExampleProcessorNode::process(AudioBus& inBus, AudioBus& outBus) {
    AudioBuffer<float>& inBuffer = *inBus.buffer;
    AudioBuffer<float>& outBuffer = *outBus.buffer;
    const uint numFrames = inBuffer.getNumberOfFrames();
    const uint numChannels = inBuffer.getNumberOfChannels();
    for (uint frameIndex = 0; frameIndex < numFrames; frameIndex++) {
        for (uint channelIndex = 0; channelIndex < numChannels; channelIndex++) {
            const float newValue = inBuffer.getSample(channelIndex, frameIndex) * gain.load();
            outBuffer.setSample(channelIndex, frameIndex, newValue);
        }
    }
    return true;
};

}
