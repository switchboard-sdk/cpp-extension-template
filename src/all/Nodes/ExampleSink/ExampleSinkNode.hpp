#include <switchboard_core/SingleBusAudioSinkNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleSinkNode : public SingleBusAudioSinkNode {
public:
    ExampleSinkNode(const std::map<std::string, std::any>& config);

    ~ExampleSinkNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& busFormat) override;
    bool consume(AudioBus& bus) override;
    Result<void> setValue(const std::string& key, const std::any& value) override;
    Result<std::any> getValue(const std::string& key) override;

private:
    float peakValue;
    uint eventIntervalFrames;
    uint frameCounter;
};

}
