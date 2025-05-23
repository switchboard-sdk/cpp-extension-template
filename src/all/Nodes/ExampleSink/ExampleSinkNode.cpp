#include "ExampleSinkNode.hpp"
#include <switchboard/Config.hpp>

namespace switchboard::extensions::exampledsp {

ExampleSinkNode::ExampleSinkNode(const std::map<std::string, std::any>& config) : peakValue {0.0f}, eventIntervalFrames {48000}, frameCounter {0} {
    type = "ExampleSinkNode";
    for (const auto& [key, value] : config) {
        Result<void> result = setValue(key, value);
        if (result.isError()) {
            throw std::runtime_error("Could not configure ExampleSourceNode object with key: " + key);
        }
    }
}

Result<void> ExampleSinkNode::setValue(const std::string& key, const std::any& value) {
    if (key == "eventIntervalFrames") {
        this->eventIntervalFrames = Config::toUInt(value);
        return makeSuccess();
    }
    return AudioNode::setValue(key, value);
}

Result<std::any> ExampleSinkNode::getValue(const std::string& key) {
    if (key == "eventIntervalFrames") {
        return makeSuccess<std::any>(std::make_any<uint>(this->eventIntervalFrames));
    }
    return AudioNode::getValue(key);
}

bool ExampleSinkNode::setBusFormat(AudioBusFormat& busFormat) {
    return true;
}

bool ExampleSinkNode::consume(AudioBus& bus) {
    AudioBuffer<float>& inBuffer = *bus.buffer;
    const uint numFrames = inBuffer.getNumberOfFrames();
    const uint numChannels = inBuffer.getNumberOfChannels();
    for (uint frameIndex = 0; frameIndex < numFrames; frameIndex++) {
        for (uint channelIndex = 0; channelIndex < numChannels; channelIndex++) {
            const float absSampleValue = fabsf(inBuffer.getSample(channelIndex, frameIndex));
            if (absSampleValue > peakValue) {
                peakValue = absSampleValue;
            }
        }
        frameCounter++;
        if (frameCounter == eventIntervalFrames) {
            emitEvent("peak", peakValue);
            peakValue = 0.0f;
            frameCounter = 0;
        }
    }
    return true;
}

}

