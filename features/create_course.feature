Feature: Create Course
  Create a course

  Scenario: Success
    Given I'm a client
    And I authenticate
    When I request to create a course
    Then response is 201 Created
    And a new course is created for the client

  Scenario: Failed
    When I request to create a course
    Then I get 401 error
    And no new course is created for the client

  Scenario: Failed
    Given I'm a client
    And I authenticate
    When I request to create a course with empty title
    Then I get 422 error
    And no new course is created for the client