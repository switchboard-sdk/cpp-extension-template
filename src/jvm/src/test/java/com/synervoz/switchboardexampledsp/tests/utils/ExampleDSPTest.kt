package com.synervoz.switchboardexampledsp.tests.utils

import com.synervoz.switchboard.sdk.SwitchboardSDK
import com.synervoz.switchboardexampledsp.ExampleDSPExtension
import org.junit.jupiter.api.BeforeAll

open class ExampleDSPTest {
    companion object {
        @BeforeAll
        @JvmStatic
        fun initAll() {
            SwitchboardSDK.initialize("synervoz", "SwitchboardSDKTests")
            ExampleDSPExtension.initialize()
        }
    }
}