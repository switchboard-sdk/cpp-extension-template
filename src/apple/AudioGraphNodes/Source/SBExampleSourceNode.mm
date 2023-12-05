#import "SBExampleSourceNode.h"
#import "ExampleSourceNode.hpp"

using switchboard::extensions::exampledsp::ExampleSourceNode;

@implementation SBExampleSourceNode {
    std::unique_ptr<ExampleSourceNode> exampleSourceNode;
}

- (instancetype)init
{
    std::unique_ptr<ExampleSourceNode> node = std::make_unique<ExampleSourceNode>();
    if (self = [super initWithAudioNode:node.get()]) {
        self->exampleSourceNode = std::move(node);
    }
    return self;
}

@end
