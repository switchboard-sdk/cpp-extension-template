#import "SBExampleProcessorNode.h"
#import "ExampleProcessorNode.hpp"

using switchboard::extensions::exampledsp::ExampleProcessorNode;

@implementation SBExampleProcessorNode {
    std::unique_ptr<ExampleProcessorNode> exampleProcessorNode;
}

- (instancetype)init
{
    std::unique_ptr<ExampleProcessorNode> node = std::make_unique<ExampleProcessorNode>();
    if (self = [super initWithAudioNode:node.get()]) {
        self->exampleProcessorNode = std::move(node);
    }
    return self;
}

@end
