package testapp

import grails.gorm.transactions.Transactional

@Transactional
class TestService {

    def save(String mesg) {
        TestMessage message = new TestMessage(message: mesg)
        message.save(flush: true)
    }
}
