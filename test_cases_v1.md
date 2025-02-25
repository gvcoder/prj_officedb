```gherkin
Feature: Selenium Automation Practice Form

  Scenario: Positive Test Case for Valid Input
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "John Doe"
    And I enter email ID as "johndoe@example.com"
    And I select gender as "Male"
    And I enter mobile number as "1234567890"
    And I select date of birth as "01/01/1990"
    And I enter subjects as "Maths, Chemistry"
    And I select hobbies as "Reading, Music"
    And I upload picture "profile.jpg"
    And I enter current address as "123 Main St, Cityville"
    And I select state as "California"
    And I select city as "Los Angeles"
    When I click on the submit button
    Then I should see a success message

  Scenario: Negative Test Case for Empty Name
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as ""
    And I enter email ID as "johndoe@example.com"
    And I select gender as "Male"
    And I enter mobile number as "1234567890"
    And I select date of birth as "01/01/1990"
    And I enter subjects as "Maths, Chemistry"
    And I select hobbies as "Reading, Music"
    And I upload picture "profile.jpg"
    And I enter current address as "123 Main St, Cityville"
    And I select state as "California"
    And I select city as "Los Angeles"
    When I click on the submit button
    Then I should see an error message "Name cannot be empty"

  Scenario: Negative Test Case for Invalid Email ID
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "John Doe"
    And I enter email ID as "invalid-email"
    And I select gender as "Male"
    And I enter mobile number as "1234567890"
    And I select date of birth as "01/01/1990"
    And I enter subjects as "Maths, Chemistry"
    And I select hobbies as "Reading, Music"
    And I upload picture "profile.jpg"
    And I enter current address as "123 Main St, Cityville"
    And I select state as "California"
    And I select city as "Los Angeles"
    When I click on the submit button
    Then I should see an error message "Please enter a valid email ID"

  Scenario: Edge Case for Maximum Length Name
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "A very long name that exceeds the character limit of the input field"
    And I enter email ID as "johndoe@example.com"
    And I select gender as "Male"
    And I enter mobile number as "1234567890"
    And I select date of birth as "01/01/1990"
    And I enter subjects as "Maths, Chemistry"
    And I select hobbies as "Reading, Music"
    And I upload picture "profile.jpg"
    And I enter current address as "123 Main St, Cityville"
    And I select state as "California"
    And I select city as "Los Angeles"
    When I click on the submit button
    Then I should see an error message "Name exceeds maximum length"

  Scenario: Positive Test Case for All Optional Fields
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "Jane Smith"
    And I enter email ID as "janesmith@example.com"
    And I select gender as "Female"
    And I enter mobile number as "0987654321"
    And I select date of birth as "12/12/1995"
    And I enter subjects as "Physics, Biology"
    And I select hobbies as "Sports"
    And I upload picture "profile.jpg"
    And I enter current address as "456 Side St, Townsville"
    And I select state as "Texas"
    And I select city as "Houston"
    When I click on the submit button
    Then I should see a success message

  Scenario: Negative Test Case for Invalid Mobile Number
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "Alice Doe"
    And I enter email ID as "alicedoe@example.com"
    And I select gender as "Female"
    And I enter mobile number as "1234"
    And I select date of birth as "02/02/1988"
    And I enter subjects as "English, Literature"
    And I select hobbies as "Traveling"
    And I upload picture "profile.jpg"
    And I enter current address as "789 High St, Village"
    And I select state as "Florida"
    And I select city as "Miami"
    When I click on the submit button
    Then I should see an error message "Mobile number is invalid"

  Scenario: Edge Case for Future Date of Birth
    Given I navigate to "https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php"
    When I enter name as "Future Person"
    And I enter email ID as "futureperson@example.com"
    And I select gender as "Other"
    And I enter mobile number as "5555555555"
    And I select date of birth as "01/01/2030"
    And I enter subjects as "Future Studies"
    And I select hobbies as "Gaming"
    And I upload picture "profile.jpg"
    And I enter current address as "999 Cloud St, Dreamland"
    And I select state as "New York"
    And I select city as "New York"
    When I click on the submit button
    Then I should see an error message "Date of birth cannot be in the future"
```

This extensive set of test cases covers various scenarios including positive tests for valid data entries, negative tests for invalid and incomplete data inputs, as well as edge test cases for boundary violations.