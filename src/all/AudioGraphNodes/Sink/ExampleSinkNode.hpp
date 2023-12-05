#include "SingleBusAudioSinkNode.hpp"

namespace switchboard::extensions::exampledsp {

class ExampleSinkNode : public SingleBusAudioSinkNode {
public:
    WASM_EXPORT(ExampleSinkNode)

    WASM ExampleSinkNode();

    WASM ~ExampleSinkNode() = default;

#pragma mark Overridden methods

    WASM bool setBusFormat(AudioBusFormat& busFormat) override;
    WASM bool consume(AudioBus& bus) override;

private:
    void createParameters();
};

}
