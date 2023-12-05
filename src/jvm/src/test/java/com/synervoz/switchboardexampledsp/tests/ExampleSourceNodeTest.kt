package com.synervoz.switchboardexampledsp.tests

import com.synervoz.switchboard.sdk.audiograph.*
import com.synervoz.switchboardexampledsp.audiographnodes.ExampleSourceNode
import com.synervoz.switchboardexampledsp.tests.utils.ExampleDSPTest
import kotlin.test.Test

internal class ExampleSourceNodeTest: ExampleDSPTest() {

    @Test
    fun testEchoNodeInit() {
        val sut = AudioGraph()
        val exampleSourceNode = ExampleSourceNode()
        sut.addNode(exampleSourceNode)
        sut.connect(exampleSourceNode, sut.outputNode)
        sut.start()

        val inAudioBusList = AudioBusList(0)

        val outAudioData = AudioData(1, 10)
        val outAudioBuffer = AudioBuffer(1, 10, false, 48000, outAudioData)
        val outAudioBus = AudioBus(outAudioBuffer)
        val outAudioBusList = AudioBusList(outAudioBus)

        sut.process(inAudioBusList, outAudioBusList)
        sut.stop()

        sut.close()
        exampleSourceNode.close()
        inAudioBusList.close()
        outAudioBuffer.close()
        outAudioBus.close()
        outAudioBusList.close()
    }
}