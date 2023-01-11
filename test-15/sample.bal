import ballerina/http;
import choreouptime/greetingtest as greetings;

greetings:Client greetingClient = check new(config = {auth: {
    clientId: "",
    clientSecret: ""
}}, serviceUrl = "http://localhost:8080");

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
