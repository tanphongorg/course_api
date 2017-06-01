Feature: Search courses
  As an authenticated client, i could search for courses by title

  Scenario: Success
    Given I'm a client
    And I authenticate
    And There are already some courses created
    When I search for course
    Then response is 200 ok
    And I get correct courses result

  Scenario: Success
    Given I'm a client
    And I authenticate
    And There are already some courses created
    When I search for course without query
    Then response is 200 ok
    And I get all courses result
