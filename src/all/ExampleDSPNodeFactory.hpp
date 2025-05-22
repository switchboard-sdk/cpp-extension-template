#pragma once

#include <switchboard_core/NodeFactory.hpp>

namespace switchboard::extensions::exampledsp {

class ExampleDSPNodeFactory : public NodeFactory {

    // MARK: Overridden methods

    std::string getNodeTypePrefix() override;
    Node* createNode(const std::string& type, const std::map<std::string, std::any>& config) override;
};

}