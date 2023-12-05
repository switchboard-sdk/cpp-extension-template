#include "SingleBusAudioSourceNode.hpp"

namespace switchboard::extensions::exampledsp {

class ExampleSourceNode : public SingleBusAudioSourceNode {
public:
    WASM_EXPORT(ExampleSourceNode)

    WASM ExampleSourceNode();

    WASM ~ExampleSourceNode() = default;

#pragma mark Overridden methods

    WASM bool setBusFormat(AudioBusFormat& busFormat) override;
    WASM bool produce(AudioBus& bus) override;

private:
    std::atomic<float> frequency;
    std::atomic<float> amplitude;
    float phase;

    void createParameters();
};

}
