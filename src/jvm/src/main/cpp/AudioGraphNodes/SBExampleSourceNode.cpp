#include "SBJNI.hpp"
#include "ExampleSourceNode.hpp"

using switchboard::extensions::exampledsp::ExampleSourceNode;

extern "C" {

JNIEXPORT void JNICALL
    Java_com_synervoz_switchboardexampledsp_audiographnodes_ExampleSourceNode_init(JNIEnv* env, jobject thiz) {
    std::shared_ptr<ExampleSourceNode> node = std::make_shared<ExampleSourceNode>();
    SBJNI::storeNativeSharedPtrInJavaObject(env, thiz, node);
}

}