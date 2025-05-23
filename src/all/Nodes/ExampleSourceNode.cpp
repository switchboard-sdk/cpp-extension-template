#include "ExampleSourceNode.hpp"

#include <cmath>
#include <switchboard/Config.hpp>

namespace switchboard::extensions::exampledsp {

ExampleSourceNode::ExampleSourceNode(const std::map<std::string, std::any>& config) : frequency {440.0f}, amplitude {0.8f}, phase {0.0f} {
    type = "ExampleSourceNode";
    for (const auto& [key, value] : config) {
        Result<void> result = setValue(key, value);
        if (result.isError()) {
            throw std::runtime_error("Could not configure ExampleSourceNode object with key: " + key);
        }
    }
}

Result<void> ExampleSourceNode::setValue(const std::string& key, const std::any& value) {
    if (key == "frequency") {
        this->frequency = Config::toFloat(value);
        return makeSuccess();
    }
    if (key == "amplitude") {
        this->amplitude = Config::toFloat(value);
        return makeSuccess();
    }
    return AudioNode::setValue(key, value);
}

Result<std::any> ExampleSourceNode::getValue(const std::string& key) {
    if (key == "frequency") {
        return makeSuccess<std::any>(std::make_any<float>(this->frequency));
    }
    if (key == "amplitude") {
        return makeSuccess<std::any>(std::make_any<float>(this->amplitude));
    }
    return AudioNode::getValue(key);
}

bool ExampleSourceNode::setBusFormat(AudioBusFormat& busFormat) {
    if (busFormat.numberOfChannels != constants::MONO) {
        return false;
    }
    return true;
}

bool ExampleSourceNode::produce(AudioBus& bus) {
    const uint numberOfFrames = bus.getBuffer()->getNumberOfFrames();
    const uint sampleRate = bus.getBuffer()->getSampleRate();
    float* floatBuffer = bus.getBuffer()->getWritePointer(0);
    const float angularFrequency = 2.0f * M_PI * frequency / sampleRate;
    for (uint i = 0; i < numberOfFrames; i++) {
        floatBuffer[i] = amplitude * sinf(phase);
        phase += angularFrequency;
        if (phase >= 2.0f * M_PI) {
            phase -= 2.0f * M_PI;
        }
    }
    return true;
}

}

