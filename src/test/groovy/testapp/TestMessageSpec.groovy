package testapp

import grails.testing.gorm.DomainUnitTest
import spock.lang.Specification

class TestMessageSpec extends Specification implements DomainUnitTest<TestMessage> {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
