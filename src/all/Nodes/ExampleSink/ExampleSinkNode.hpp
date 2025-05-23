#include <switchboard_core/SingleBusAudioSinkNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleSinkNode : public SingleBusAudioSinkNode {
public:
    ExampleSinkNode();

    ~ExampleSinkNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& busFormat) override;
    bool consume(AudioBus& bus) override;
};

}
