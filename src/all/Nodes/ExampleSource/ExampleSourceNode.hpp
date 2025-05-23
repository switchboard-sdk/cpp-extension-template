#include <switchboard_core/SingleBusAudioSourceNode.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleSourceNode : public SingleBusAudioSourceNode {
public:
    ExampleSourceNode(const std::map<std::string, std::any>& config);

    ~ExampleSourceNode() = default;

#pragma mark Overridden methods

    bool setBusFormat(AudioBusFormat& busFormat) override;
    bool produce(AudioBus& bus) override;
    Result<void> setValue(const std::string& key, const std::any& value) override;
    Result<std::any> getValue(const std::string& key) override;

private:
    std::atomic<float> frequency;
    std::atomic<float> amplitude;
    float phase;
};

}
