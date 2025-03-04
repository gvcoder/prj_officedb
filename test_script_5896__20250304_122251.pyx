```python
# Importing Required Libraries
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import json

# Test Data in JSON format
test_data_json = '''
{
    "test_cases": [
        {
            "description": "Verify login functionality with valid credentials",
            "url": "https://example.com/login",
            "data": {
                "username": "testuser",
                "password": "securepassword"
            },
            "expected": "Welcome, testuser!"
        },
        {
            "description": "Verify login functionality with invalid credentials",
            "url": "https://example.com/login",
            "data": {
                "username": "wronguser",
                "password": "wrongpassword"
            },
            "expected": "Invalid username or password."
        }
    ]
}
'''

# Parse JSON Data
test_data = json.loads(test_data_json)

# Initialize WebDriver
driver = webdriver.Chrome()
driver.implicitly_wait(10)

# Function to execute test cases
def run_test_case(test_case):
    print(f"Executing: {test_case['description']}")
    
    # Navigate to the URL
    driver.get(test_case['url'])
    time.sleep(2)  # Delay for visibility

    # Perform actions based on the test case
    driver.find_element(By.NAME, 'username').send_keys(test_case['data']['username'])
    driver.find_element(By.NAME, 'password').send_keys(test_case['data']['password'])
    driver.find_element(By.CSS_SELECTOR, 'button[type="submit"]').click()
    time.sleep(2)  # Delay for visibility
    
    # Validate result
    try:
        actual_result = driver.find_element(By.CLASS_NAME, 'welcome-message').text
        assert actual_result == test_case['expected'], f"Expected: {test_case['expected']}, but got: {actual_result}"
        print(f"Test Passed: {test_case['description']}")
    except AssertionError as e:
        print(f"Test Failed: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        time.sleep(2)  # Delay to observe the result

# Execute all test cases
for case in test_data['test_cases']:
    run_test_case(case)

# Close WebDriver
driver.quit()
```

### Explanation of the Script:
- Import the necessary libraries including **Selenium WebDriver**, **By** for locating elements, and **json** for parsing test data.
- Define the test data in JSON format, listing out individual test cases along with their expected outcomes.
- Initialize a WebDriver instance and set implicit wait for stability.
- Create a function `run_test_case` that:
  - Navigates to the provided URL.
  - Fills in username and password fields by finding elements using their **name** and using a **CSS selector** for the submit button.
  - Validates the result by checking the actual welcome message text against the expected result.
  - Handles any exceptions and prints appropriate messages indicating the pass/fail of each test case.
- Iterate through each test case defined in the JSON data and execute it by calling `run_test_case`.
- Finally, close the WebDriver to clean up resources.

This script is structured to clearly demonstrate typical automation testing practices while being robust enough for error handling and reporting. Delays are added to ensure the visibility of test execution outputs.