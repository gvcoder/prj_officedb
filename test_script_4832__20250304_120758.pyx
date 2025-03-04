```python
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Initialize the WebDriver
driver = webdriver.Chrome(executable_path='path/to/chromedriver')  # Update the path to your chromedriver

# Sample JSON data for the test cases
json_data = [
    {
        "test_case": "Open Google",
        "url": "https://www.google.com",
        "element": {"by": "name", "value": "q"},
        "action": "type",
        "input": "Automation Testing",
        "print_message": "Google Page Opened and Search Field Found"
    },
    {
        "test_case": "Search in Google",
        "url": "https://www.google.com",
        "element": {"by": "name", "value": "q"},
        "action": "submit",
        "print_message": "Search for 'Automation Testing' performed"
    },
    {
        "test_case": "Click on the first link",
        "url": "https://www.google.com",
        "element": {"by": "xpath", "value": "(//h3)[1]"},
        "action": "click",
        "print_message": "First search result clicked"
    }
]

# Function to execute test cases
def run_test_case(test_case):
    try:
        # Open the specified URL
        driver.get(test_case['url'])
        time.sleep(2)  # Delay to make the output visible

        # Find the element based on the strategy provided
        by = test_case['element']['by']
        value = test_case['element']['value']

        if by == 'name':
            element = driver.find_element(By.NAME, value)
        elif by == 'xpath':
            element = driver.find_element(By.XPATH, value)
        elif by == 'id':
            element = driver.find_element(By.ID, value)
        elif by == 'css selector':
            element = driver.find_element(By.CSS_SELECTOR, value)
        elif by == 'class name':
            element = driver.find_element(By.CLASS_NAME, value)
        elif by == 'link text':
            element = driver.find_element(By.LINK_TEXT, value)
        elif by == 'partial link text':
            element = driver.find_element(By.PARTIAL_LINK_TEXT, value)
        elif by == 'tag name':
            element = driver.find_element(By.TAG_NAME, value)
        else:
            print("Invalid selector type")
            return

        # Perform the action based on the test case
        if test_case['action'] == 'type':
            element.send_keys(test_case['input'])
        elif test_case['action'] == 'submit':
            element.send_keys(Keys.RETURN)
        elif test_case['action'] == 'click':
            element.click()

        time.sleep(2)  # Delay to make the output visible
        print(f"{test_case['print_message']} - Test Case `{test_case['test_case']}` passed.")

    except Exception as e:
        print(f"Error occurred in Test Case `{test_case['test_case']}`: {str(e)}")

# Run each test case
for case in json_data:
    run_test_case(case)

# Closing the driver after tests
driver.quit()
```

In this script:
- A list of test cases is defined in JSON format.
- The Selenium WebDriver is used to interact with the browser.
- Each test case is executed in a loop, with output printing statements to indicate results.
- There are error handling mechanisms to capture any exceptions that occur during execution.
- Delays are added to allow visibility of the actions being performed on the browser.