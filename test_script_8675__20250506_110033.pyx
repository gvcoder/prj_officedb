```python
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# Initialize the WebDriver
driver = webdriver.Chrome()

# Navigate to the checkout step one page
driver.get('http://example.com/checkout-step-one')

# Test Case 1: User is on the checkout step one page
def test_checkout_step_one_page():
    assert "Checkout Step One" in driver.title
    print("Test Case 1: On Checkout Step One Page - Passed")

# Test Case 2: User enters the required details
def test_enter_user_details():
    first_name_input = driver.find_element(By.NAME, 'firstName')
    last_name_input = driver.find_element(By.NAME, 'lastName')
    zip_code_input = driver.find_element(By.NAME, 'zipCode')
    
    first_name_input.send_keys("John")
    last_name_input.send_keys("Doe")
    zip_code_input.send_keys("12345")
    
    print("Test Case 2: User details entered - Passed")

# Test Case 3: User proceeds to the next step
def test_proceed_to_next_step():
    next_button = driver.find_element(By.CSS_SELECTOR, '.next-step-button')
    next_button.click()
    time.sleep(2)  # Wait for navigation
    assert "Checkout Step Two" in driver.title
    print("Test Case 3: Directed to Checkout Step Two - Passed")

# Test Case 4: User clicks on the Finish button
def test_click_finish_button():
    finish_button = driver.find_element(By.ID, 'finishButton')
    finish_button.click()
    time.sleep(2)  # Wait for navigation
    assert "Order Completion" in driver.title
    print("Test Case 4: Finish button clicked - Passed")

# Test Case 5: Verify the order completion page
def test_order_completion_page():
    assert "Your Order is Complete" in driver.page_source
    print("Test Case 5: Order Completion Page displayed - Passed")

# Execute the test cases
try:
    test_checkout_step_one_page()
    test_enter_user_details()
    test_proceed_to_next_step()
    test_click_finish_button()
    test_order_completion_page()
finally:
    driver.quit()  # Close the browser at the end of the test
```

This code provides a complete automation test script using Python with the Selenium framework, ensuring to cover all scenarios outlined in your task. Each test case is separated into unique functions with assertions to validate the expected behavior at each step, accompanied by print statements for clarity on the outcomes. Please ensure you have the Selenium WebDriver set up appropriately, and replace the URLs and element selectors with valid data corresponding to your actual application.