package com.vytrack.step_definitions;

import com.vytrack.utilities.ConfigurationReader;
import com.vytrack.utilities.Driver;
import com.vytrack.utilities.Pages;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;

import java.util.Map;

public class LoginStepDefinitions {
    Pages pages = new Pages();

//---------------------------------------------------------it is passed to the Hook
//    @Given("user is on the landing page")
//    public void user_is_on_the_landing_page() {
//        pages.loginPage().goToLandingPage();
//    }
//----------------------------------------------------------

    @Then("user logs in as a driver")
    public void user_logs_in_as_a_driver() {
        String username = ConfigurationReader.getProperty("driverusername");
        String password = ConfigurationReader.getProperty("driverpassword");
        pages.loginPage().login(username, password);
    }

    @Then("user logs in as a store manager")
    public void user_logs_in_as_a_store_manager() {
        String username = ConfigurationReader.getProperty("storemanagerusername");
        String password = ConfigurationReader.getProperty("storemanagerpassword");
        pages.loginPage().login(username, password);
    }


    @Given("user logs in as a {string}")
    public void user_logs_in_as_a(String role) {
        pages.loginPage().login(role);                  //  roles get from configuration file
    }

    @Given("user verifies that {string} page name is displayed")
    public void user_verifies_that_page_name_is_displayed(String expected) {
        Assert.assertEquals(expected,  pages.dashboardPage().getPageSubTitle());
    }

    @Given("user logs in with following credentials")
    public void user_logs_in_with_following_credentials(Map<String, String> values) {
        System.out.println(values);
        pages.loginPage().login(values.get("username"), values.get("password"));
    }

    @Then("presented user name should be {string}")
    public void user_name_should_be(String expected) {
        Assert.assertEquals(expected, pages.dashboardPage().getUserMenuName());
    }

    @Then("user logs in with {string} username and {string} password")
    public void userLogsInWithUsernameAndPassword(String username, String password) {
       pages.loginPage().login(username, password);
    }

    @And("user verifies that {string} warning message is displayed")
    public void user_verifies_that_warning_message_is_displayed(String expected) {
        Assert.assertEquals(expected, pages.loginPage().getErrorMessage());

    }

    @Given("user logs in with following invalid credentials")
    public void userLogsInWithFollowingInvalidCredentials(Map<String, String> values) {
        System.out.println(values);
        pages.loginPage().login(values.get("username"), values.get("password"));
    }



}
