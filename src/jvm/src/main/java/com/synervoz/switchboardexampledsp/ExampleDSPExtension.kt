package com.synervoz.switchboardexampledsp

import com.synervoz.switchboard.sdk.SwitchboardSDKExtension
import com.synervoz.switchboard.sdk.utils.LibraryLoader
import com.synervoz.switchboardexampledsp.audiographnodes.nodes

object ExampleDSPExtension : SwitchboardSDKExtension {
    init {
        LibraryLoader.loadLibrary(ExampleDSPExtension.javaClass, "SwitchboardExampleDSPExtension")
    }

    @JvmStatic
    external fun initialize()

    override fun getFullyQualifiedAudioNodeNames(): List<String> {
        return nodes
    }
}
