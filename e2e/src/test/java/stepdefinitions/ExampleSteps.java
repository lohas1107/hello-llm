package stepdefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class ExampleSteps {

    private int firstNumber;
    private int secondNumber;
    private int result;

    @Given("I have entered {int} into the calculator")
    public void i_have_entered_number_into_calculator(int number) {
        if (firstNumber == 0) {
            firstNumber = number;
        } else {
            secondNumber = number;
        }
    }

    @When("I press add")
    public void i_press_add() {
        result = firstNumber + secondNumber;
    }

    @Then("the result should be {int}")
    public void the_result_should_be(int expectedResult) {
        assertEquals(expectedResult, result);
        firstNumber = 0;
        secondNumber = 0;
        result = 0;
    }
}