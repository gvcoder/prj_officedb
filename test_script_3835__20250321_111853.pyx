```python
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Set up the webdriver (make sure you have the appropriate WebDriver executable)
driver = webdriver.Chrome()  # or webdriver.Firefox() or any other supported browser

try:
    # Step 1: Log into the account
    driver.get("https://example.com/login")  # Replace with the actual login URL
    time.sleep(2)

    # Enter username and password and submit (modify selectors as necessary)
    driver.find_element(By.ID, "username").send_keys("your_username")  # Replace with username field ID
    driver.find_element(By.ID, "password").send_keys("your_password")  # Replace with password field ID
    driver.find_element(By.ID, "loginButton").click()  # Replace with login button ID
    
    time.sleep(3)  # Wait for login to complete

    print("Logged into the account successfully!")

    # Step 2: Navigate to the payment information section
    driver.find_element(By.LINK_TEXT, "Payment Information").click()  # Replace with the correct link text
    time.sleep(2)

    print("Navigated to the payment information section.")

    # Step 3: Enter an expired credit card
    expired_card_number = "1234 5678 9012 3456"  # Example of expired credit card
    expiry_date = "01/21"  # Example of an expired expiry date
    driver.find_element(By.ID, "cardNumber").send_keys(expired_card_number)  # Replace with card number field ID
    driver.find_element(By.ID, "expiryDate").send_keys(expiry_date)  # Replace with expiry date field ID
    time.sleep(1)

    print("Entered expired credit card details.")

    # Step 4: Click on "Save Payment Information"
    driver.find_element(By.ID, "savePaymentButton").click()  # Replace with the save button ID
    time.sleep(3)

    print("Clicked on Save Payment Information.")

    # Step 5: Validate the error message
    error_message = driver.find_element(By.CSS_SELECTOR, ".error-message").text  # Replace with the appropriate error message selector
    expected_message = "Credit card has expired."  
    
    if error_message == expected_message:
        print("Test Passed: Error message displayed correctly:", error_message)
    else:
        print("Test Failed: Expected message:", expected_message, "but got:", error_message)

    time.sleep(2)  # Just to see the results before closing

finally:
    driver.quit()  # Ensure that any opened resources are closed
```
This script covers all the steps in the provided scenario to attempt to save payment information with an expired credit card, checks for the outcome, and prints the results accordingly. It uses appropriate Selenium functions for interacting with web elements and includes waits between actions to ensure the UI is responsive. Each step includes print statements to inform the progress and result of the test. Please replace placeholder values such as URLs and element ids with actual values from your application.