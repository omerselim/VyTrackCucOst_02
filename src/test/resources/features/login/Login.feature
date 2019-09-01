@VYT-4121
  Feature: Login
  As user I want to login under different roles
# So hook will take care of this action
#  Hook will open main page
#  Background:
#    Given user is on the landing page


    @driver
    Scenario: Login as a driver
      Then user logs in as a driver
      And user verifies that "Quick Launchpad" page name is displayed

    @storemanager
    Scenario: Login as a store manager
      Then user logs in as a store manager
      And user verifies that "Dashboard" page name is displayed

    @negative_01
    Scenario: Verify warning message for invalid credentials
      Then user logs in with "wrong" username and "wrong" password
      And user verifies that "Invalid user name or password." warning message is displayed

    @negative_01
    Scenario Outline: Verify warning message for invalid credentials
      Given user logs in with following invalid credentials
        | username | <username> |
        | password | <password> |
      And user verifies that "Invalid user name or password." warning message is displayed

      Examples: Credentials information
        | username        | password     |
        | username        | password     |
        | user187         | useruser123  |
        | user187         | UserUser12   |
        | user187         | UserUser     |
        | user187         | UserUser 123 |
        | user187         | USERUSER123  |
        | User187         | UserUser123  |
        | USER187         | UserUser123  |
        | user18          | UserUser123  |
        | ser187          | UserUser123  |
        | user            | UserUser123  |
        | storemanager52  | useruser123  |
        | storemanager52  | UserUser12   |
        | storemanager52  | UserUser     |
        | storemanager52  | UserUser 123 |
        | storemanager52  | USERUSER123  |
        | Storemanager52  | UserUser123  |
        | STOREMANAGER52  | UserUser123  |
        | store manager52 | UserUser123  |
        | toremanager52   | UserUser123  |
        | storemanager    | UserUser123  |
        | salesmanager125 | useruser123  |
        | salesmanager125 | UserUser12   |
        | salesmanager125 | UserUser     |
        | salesmanager125 | UserUser 123 |
        | salesmanager125 | USERUSER123  |
        | Salesmanager125 | UserUser123  |
        | SALESMANAGER125 | UserUser123  |
        | sales manager125| UserUser123  |
        | alesmanager125  | UserUser123  |
        | salesemanager   | UserUser123  |




  @map_example
  Scenario: Login as different users
    Given user logs in with following credentials
      | username | salesmanager101 |
      | password | UserUser123     |
    Then user navigates to "Fleet" and "Vehicles"
    And user verifies that "All Cars" page name is displayed

  @login_1
  Scenario Outline: login as different user tests
    Given user logs in as a "<user_type>"
    And user verifies that "<page name>" page name is displayed

    Examples:
      | user_type     | page name       |
      | driver        | Quick Launchpad |
      | sales manager | Dashboard       |
      | store manager | Dashboard       |

    @login_with_outline_2
    Scenario Outline: Users login test
      Given user logs in with following credentials
        | username | <username> |
        | password | <password> |
      Then presented user name should be "<name>"

      Examples: Credentials information
        | username        | password    | name             |
        | user187         | UserUser123 | Elenor Kreiger   |
        | user200         | UserUser123 | Meggie Macejkovic|
        | storemanager52  | UserUser123 | Lorine Johns     |
        | storemanager66  | UserUser123 | Albin Lemke      |
        | salesmanager125 | UserUser123 | Deion Fadel      |
        | salesmanager140 | UserUser123 | Matteo Hegmann   |

    @login_with_outline_3
    Scenario Outline: page titles with different users
      Given user logs in as a "<user_type>"
      Then user navigates to "<tab>" and "<module>"
      Then the page title should be "<title>"

      Examples: User and navigation info
        | user_type     | tab        | module          | title                                                              |
        | driver        | Fleet      | Vehicles        | Car - Entities - System - Car - Entities - System                  |
        | driver        | Fleet      | Vehicles Model  | Vehicles Model - Entities - System - Car - Entities - System       |
        | driver        | Customers  | Accounts        | Accounts - Customers                                               |
        | driver        | Customers  | Contacts        | Contacts - Customers                                               |
        | driver        | Activities | Calendar Events | Calendar Events - Activities                                       |
        | driver        | System     | Jobs            | Jobs - System                                                      |
        | sales manager | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | sales manager | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | sales manager | Customers  | Accounts        | All - Accounts - Customers                                         |
        | sales manager | Customers  | Contacts        | All - Contacts - Customers                                         |
        | sales manager | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | sales manager | System     | Jobs            | All - Jobs - System                                                |
        | store manager | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | store manager | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | store manager | Customers  | Accounts        | All - Accounts - Customers                                         |
        | store manager | Customers  | Contacts        | All - Contacts - Customers                                         |
        | store manager | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | store manager | System     | Jobs            | All - Jobs - System                                                |


    @login_with_outline_4
    Scenario Outline: Users login test
      Given user logs in with following credentials
        | username | <username> |
        | password | <password> |
      Then presented user name should be "<name>"
      Then user navigates to "<tab>" and "<module>"
      Then the page title should be "<title>"

      Examples: User and navigation info
        | username        | password    | name              | tab        | module          | title                                                              |
        | user187         | UserUser123 | Elenor Kreiger    | Fleet      | Vehicles        | Car - Entities - System - Car - Entities - System                  |
        | user187         | UserUser123 | Elenor Kreiger    | Fleet      | Vehicles Model  | Vehicles Model - Entities - System - Car - Entities - System       |
        | user187         | UserUser123 | Elenor Kreiger    | Customers  | Accounts        | Accounts - Customers                                               |
        | user187         | UserUser123 | Elenor Kreiger    | Customers  | Contacts        | Contacts - Customers                                               |
        | user187         | UserUser123 | Elenor Kreiger    | Activities | Calendar Events | Calendar Events - Activities                                       |
        | user187         | UserUser123 | Elenor Kreiger    | System     | Jobs            | Jobs - System                                                      |
        | user200         | UserUser123 | Meggie Macejkovic | Fleet      | Vehicles        | Car - Entities - System - Car - Entities - System                  |
        | user200         | UserUser123 | Meggie Macejkovic | Fleet      | Vehicles Model  | Vehicles Model - Entities - System - Car - Entities - System       |
        | user200         | UserUser123 | Meggie Macejkovic | Customers  | Accounts        | Accounts - Customers                                               |
        | user200         | UserUser123 | Meggie Macejkovic | Customers  | Contacts        | Contacts - Customers                                               |
        | user200         | UserUser123 | Meggie Macejkovic | Activities | Calendar Events | Calendar Events - Activities                                       |
        | user200         | UserUser123 | Meggie Macejkovic | System     | Jobs            | Jobs - System                                                      |
        | salesmanager125 | UserUser123 | Deion Fadel       | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | salesmanager125 | UserUser123 | Deion Fadel       | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | salesmanager125 | UserUser123 | Deion Fadel       | Customers  | Accounts        | All - Accounts - Customers                                         |
        | salesmanager125 | UserUser123 | Deion Fadel       | Customers  | Contacts        | All - Contacts - Customers                                         |
        | salesmanager125 | UserUser123 | Deion Fadel       | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | salesmanager125 | UserUser123 | Deion Fadel       | System     | Jobs            | All - Jobs - System                                                |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | Customers  | Accounts        | All - Accounts - Customers                                         |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | Customers  | Contacts        | All - Contacts - Customers                                         |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | salesmanager140 | UserUser123 | Matteo Hegmann    | System     | Jobs            | All - Jobs - System                                                |
        | storemanager52  | UserUser123 | Lorine Johns      | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | storemanager52  | UserUser123 | Lorine Johns      | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | storemanager52  | UserUser123 | Lorine Johns      | Customers  | Accounts        | All - Accounts - Customers                                         |
        | storemanager52  | UserUser123 | Lorine Johns      | Customers  | Contacts        | All - Contacts - Customers                                         |
        | storemanager52  | UserUser123 | Lorine Johns      | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | storemanager52  | UserUser123 | Lorine Johns      | System     | Jobs            | All - Jobs - System                                                |
        | storemanager66  | UserUser123 | Albin Lemke       | Fleet      | Vehicles        | All - Car - Entities - System - Car - Entities - System            |
        | storemanager66  | UserUser123 | Albin Lemke       | Fleet      | Vehicles Model  | All - Vehicles Model - Entities - System - Car - Entities - System |
        | storemanager66  | UserUser123 | Albin Lemke       | Customers  | Accounts        | All - Accounts - Customers                                         |
        | storemanager66  | UserUser123 | Albin Lemke       | Customers  | Contacts        | All - Contacts - Customers                                         |
        | storemanager66  | UserUser123 | Albin Lemke       | Activities | Calendar Events | All - Calendar Events - Activities                                 |
        | storemanager66  | UserUser123 | Albin Lemke       | System     | Jobs            | All - Jobs - System                                                |





