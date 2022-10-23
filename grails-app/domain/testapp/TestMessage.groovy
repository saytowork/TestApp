package testapp

class TestMessage implements Serializable {

    String message

    static constraints = {
        message nullable: false
    }
}
