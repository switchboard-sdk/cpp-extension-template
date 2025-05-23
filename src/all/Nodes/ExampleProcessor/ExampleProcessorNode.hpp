#include <switchboard_core/SingleBusAudioProcessorNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleProcessorNode : public SingleBusAudioProcessorNode {
public:
    ExampleProcessorNode(const std::map<std::string, std::any>& config);

    ~ExampleProcessorNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& inputBusFormat, AudioBusFormat& outputBusFormat) override;
    bool process(AudioBus& inBus, AudioBus& outBus) override;
    Result<void> setValue(const std::string& key, const std::any& value) override;
    Result<std::any> getValue(const std::string& key) override;

private:
    std::atomic<float> gain;
};

}
