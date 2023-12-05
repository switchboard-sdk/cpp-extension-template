#import "SBExampleSinkNode.h"
#import "ExampleSinkNode.hpp"

using switchboard::extensions::exampledsp::ExampleSinkNode;

@implementation SBExampleSinkNode {
    std::unique_ptr<ExampleSinkNode> exampleSinkNode;
}

- (instancetype)init
{
    std::unique_ptr<ExampleSinkNode> node = std::make_unique<ExampleSinkNode>();
    if (self = [super initWithAudioNode:node.get()]) {
        self->exampleSinkNode = std::move(node);
    }
    return self;
}

@end
