#include "SBJNI.hpp"
#include "ExampleDSPExtension.hpp"

using switchboard::extensions::exampledsp::ExampleDSPExtension;

extern "C" {

JNIEXPORT void JNICALL
    Java_com_synervoz_switchboardexampledsp_ExampleDSPExtension_initialize(JNIEnv* env, jobject thiz) {
    ExampleDSPExtension::initialize();
}
}
