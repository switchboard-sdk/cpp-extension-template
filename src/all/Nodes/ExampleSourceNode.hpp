#include <switchboard_core/SingleBusAudioSourceNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleSourceNode : public SingleBusAudioSourceNode {
public:
    ExampleSourceNode();

    ~ExampleSourceNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& busFormat) override;
    bool produce(AudioBus& bus) override;

private:
    std::atomic<float> frequency;
    std::atomic<float> amplitude;
    float phase;

    void createParameters();
};

}
