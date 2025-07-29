#include "ExampleDSPExtension.hpp"

#include <switchboard_core/Logger.hpp>
#include <switchboard_core/ExtensionManager.hpp>
#include "ExampleDSPNodeFactory.hpp"

namespace switchboard::extensions::exampledsp {

void ExampleDSPExtension::load() {
    ExtensionManager::getInstance().registerExtension(std::make_shared<ExampleDSPExtension>());
}

std::string ExampleDSPExtension::getName() {
    return "ExampleDSP";
}

std::shared_ptr<NodeFactory> ExampleDSPExtension::getNodeFactory() {
    return std::make_shared<ExampleDSPNodeFactory>();
}

}
