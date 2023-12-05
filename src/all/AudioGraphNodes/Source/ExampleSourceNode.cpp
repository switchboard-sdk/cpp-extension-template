#include "ExampleSourceNode.hpp"
#include "FloatPointerParameter.hpp"

namespace switchboard::extensions::exampledsp {

ExampleSourceNode::ExampleSourceNode() : frequency {440.0f}, amplitude {0.8f}, phase {0.0f} {
    type = "ExampleSourceNode";
    createParameters();
}

void ExampleSourceNode::createParameters() {
    parameters.push_back(std::make_unique<FloatPointerParameter>(
        "Frequency",
        &frequency,
        0,
        22000
    ));
    parameters.push_back(std::make_unique<FloatPointerParameter>(
        "Amplitude",
        &amplitude,
        0,
        1
    ));
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

