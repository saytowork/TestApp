package testapp

import grails.converters.JSON

class TestController {
    def testService

    def index() {
        final Set<TestMessage> messages = TestMessage.findAll()

        [messages: messages]
    }

    def saveMessage() {
        final String newMesg = params.input
        testService.save(newMesg)

        render([success: true] as JSON)
    }

    def createError() {
        throw new ArrayIndexOutOfBoundsException()
    }
}
