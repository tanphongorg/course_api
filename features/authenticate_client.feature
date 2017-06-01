Feature: Authenticate Client
  Authenticate API consumer client

  Scenario: Success
    Given I'm a client
    When I authenticate    
    Then I get JWT token
    And response is 200 ok

  Scenario: Fail
    Given I'm a client
    When I authenticate with wrong credentials
    Then I get 422 error