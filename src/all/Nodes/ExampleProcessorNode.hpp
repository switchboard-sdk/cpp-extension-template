#include <switchboard_core/SingleBusAudioProcessorNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleProcessorNode : public SingleBusAudioProcessorNode {
public:
    ExampleProcessorNode();

    ~ExampleProcessorNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& inputBusFormat, AudioBusFormat& outputBusFormat) override;
    bool process(AudioBus& inBus, AudioBus& outBus) override;

private:
    std::atomic<float> gain;

    void createParameters();
};

}
