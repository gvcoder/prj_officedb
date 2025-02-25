```gherkin
Feature: Selenium Automation Practice Form

Scenario: Submit form with valid data
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see a success message indicating form submission

Scenario: Submit form with blank Name
    Given I visit the Selenium Automation Practice page
    When I enter "" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see an error message for Name field

Scenario: Submit form with invalid Email ID
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see an error message for Email ID field

Scenario: Submit form with invalid Mobile number
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "123456" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see an error message for Mobile number field

Scenario: Submit form without selecting any Hobbies
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see a warning message for Hobbies

Scenario: Submit form with future Date Of Birth
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/2025" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see an error message for Date Of Birth

Scenario: Submit form without uploading a Picture
    Given I visit the Selenium Automation Practice page
    When I enter "John Doe" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see a warning message for Picture

Scenario: Submit form with excessively long Name
    Given I visit the Selenium Automation Practice page
    When I enter "Johnathan Alexander William Smith Doe the Third" as Name
    And I enter "john.doe@example.com" as Email ID
    And I select "Male" as Gender
    And I enter "9876543210" as Mobile
    And I enter "01/01/1990" as Date Of Birth
    And I select "Maths" as Subject
    And I check "Cricket" as Hobby
    And I upload "profile_picture.png" as Picture
    And I enter "123 Main St" as Current Address
    And I select "California" as State
    And I select "Los Angeles" as City
    Then I should see an error message for Name length
```