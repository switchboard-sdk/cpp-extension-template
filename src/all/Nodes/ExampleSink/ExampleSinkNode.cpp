#include "ExampleSinkNode.hpp"

namespace switchboard::extensions::exampledsp {

ExampleSinkNode::ExampleSinkNode() {
    type = "ExampleSinkNode";
}

bool ExampleSinkNode::setBusFormat(AudioBusFormat& busFormat) {
    return true;
}

bool ExampleSinkNode::consume(AudioBus& bus) {
    return true;
}

}

