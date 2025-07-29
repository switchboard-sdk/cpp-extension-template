#include "ExampleDSPExtension.hpp"

#include <switchboard_core/Logger.hpp>
#include <switchboard_core/SwitchboardObjectFactory.hpp>
#include "ExampleDSPNodeFactory.hpp"

namespace switchboard::extensions::exampledsp {

void ExampleDSPExtension::initialize() {
    Logger::debug("Initialized Switchboard Extension -- ExampleDSP --");

    std::shared_ptr<NodeFactory> nodeFactory = std::make_shared<ExampleDSPNodeFactory>();
    SwitchboardObjectFactory::addNodeFactory(nodeFactory);
}
}
