```gherkin
Feature: Selenium Automation Practice Form Validation

  Scenario: Positive Test Case for all fields
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the success message "Form submitted successfully!"

  Scenario: Negative Test Case for empty Name field
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with ""
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the error message "Name is required."

  Scenario: Negative Test Case for invalid Email ID
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "invalid-email"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the error message "Please enter a valid email address."

  Scenario: Edge Test Case for Mobile field with less than 10 digits
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "12345678"    # Less than 10 digits
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the error message "Mobile number must be 10 digits."

  Scenario: Positive Test Case for multiple Subjects
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths, Science"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the success message "Form submitted successfully!"

  Scenario: Negative Test Case for unselected Gender
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the error message "Gender is required."

  Scenario: Edge Test Case for Current Address with maximum characters
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."  # Max characters
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the error message "Current Address exceeds maximum length."

  Scenario: Positive Test Case for State and City selection
    Given I am on the Selenium Automation Practice form page
    When I fill in the Name with "John Doe"
    And I fill in the Email ID with "johndoe@example.com"
    And I select Gender as "Male"
    And I fill in the Mobile with "1234567890"
    And I fill in the Date Of Birth with "1990-01-01"
    And I fill in the Subjects with "Maths"
    And I check Hobbies as "Reading"
    And I upload a Picture
    And I fill in the Current Address with "123 Elm Street"
    And I select State as "California"
    And I select City as "Los Angeles"
    Then I should see the success message "Form submitted successfully!"
```

These test cases cover positive scenarios, negative scenarios, and edge cases for the various fields on the form. Each case is crafted to provide clarity and completeness, ensuring that all possible user interactions with the form are accounted for.