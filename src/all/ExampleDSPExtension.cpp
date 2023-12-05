#include "ExampleDSPExtension.hpp"

#include "Logger.hpp"

namespace switchboard::extensions::exampledsp {

void ExampleDSPExtension::initialize() {
    Logger::debug("Initialized Switchboard Extension -- ExampleDSP --");
}
}
