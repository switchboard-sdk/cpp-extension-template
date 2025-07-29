#include "ExampleProcessorNode.hpp"
#include <switchboard/Config.hpp>
#include <stdexcept>

namespace switchboard::extensions::exampledsp {

ExampleProcessorNode::ExampleProcessorNode(const std::map<std::string, std::any>& config) : gain {1.0f} {
    type = "ExampleProcessorNode";
    for (const auto& [key, value] : config) {
        Result<void> result = setValue(key, value);
        if (result.isError()) {
            throw std::runtime_error("Could not configure ExampleSourceNode object with key: " + key);
        }
    }
}

Result<void> ExampleProcessorNode::setValue(const std::string& key, const std::any& value) {
    if (key == "gain") {
        this->gain = Config::convert<float>(value);
        return makeSuccess();
    }
    return AudioNode::setValue(key, value);
}

Result<std::any> ExampleProcessorNode::getValue(const std::string& key) {
    if (key == "gain") {
        return makeSuccess<std::any>(std::make_any<float>(this->gain));
    }
    return AudioNode::getValue(key);
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
