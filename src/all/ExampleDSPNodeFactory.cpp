#include "ExampleDSPNodeFactory.hpp"

#include "ExampleSourceNode.hpp"
#include "ExampleProcessorNode.hpp"
#include "ExampleSinkNode.hpp"

namespace switchboard::extensions::exampledsp {

std::string ExampleDSPNodeFactory::getNodeTypePrefix() {
    return "ExampleDSP";
}

Node* ExampleDSPNodeFactory::createNode(const std::string& type, const std::map<std::string, std::any>& config) {
    if (type == "ExampleSource") {
        return new ExampleSourceNode(config);
    }
    if (type == "ExampleProcessor") {
        return new ExampleProcessorNode();
    }
    if (type == "ExampleSink") {
        return new ExampleSinkNode();
    }
    return nullptr;
}

}
