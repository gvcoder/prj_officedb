```python
# Import required libraries
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Define the test registration function
def test_registration_existing_username():
    # Set up the driver (Make sure to specify the path to your WebDriver if necessary)
    driver = webdriver.Chrome()
    
    try:
        # Step 1: Navigate to the registration page
        driver.get("http://example.com/registration")  # Replace with the actual URL
        print("Navigated to the registration page.")
        time.sleep(2)  # Wait for the page to load

        # Step 2: Enter existing username
        username_field = driver.find_element(By.NAME, "username")  # Change locator as per the actual input field
        username_field.send_keys("existingUser")
        print("Entered username: existingUser")
        time.sleep(1)
        
        # Step 3: Enter mobile number
        mobile_field = driver.find_element(By.NAME, "mobile")  # Change locator as per the actual input field
        mobile_field.send_keys("1234567890")
        print("Entered mobile number: 1234567890")
        time.sleep(1)
        
        # Step 4: Enter email ID
        email_field = driver.find_element(By.NAME, "email")  # Change locator as per the actual input field
        email_field.send_keys("newuser@example.com")
        print("Entered email ID: newuser@example.com")
        time.sleep(1)
        
        # Step 5: Click on the register button
        register_button = driver.find_element(By.ID, "registerButton")  # Change locator as per the actual button
        register_button.click()
        print("Clicked on the register button.")
        time.sleep(2)  # Wait to process the registration

        # Step 6: Verify the error message
        error_message = driver.find_element(By.CLASS_NAME, "error-message")  # Change locator as per the actual error message
        assert error_message.text == "Username already exists", "Error message did not match expected."
        print("Test Passed: Error message displayed correctly - 'Username already exists'.")

    except Exception as e:
        print(f"An error occurred: {e}")
    
    finally:
        # Close the browser after the test
        driver.quit()
        print("Closed the browser.")

# Run the test
test_registration_existing_username()
```

### Explanation:
1. **Imports**: Necessary libraries are imported, including `webdriver` and `By` from Selenium.
2. **Function Definition**: A function `test_registration_existing_username` is defined for the registration process.
3. **WebDriver Setup**: The Chrome WebDriver is initialized.
4. **Navigating to Registration Page**: The test navigates to the specified registration page.
5. **Input Fields**: The script finds necessary input fields (username, mobile number, and email) by their respective properties, inputs values, and logs each action.
6. **Register Button**: Triggers the registration process by clicking the register button.
7. **Error Message Validation**: Lastly, it checks if the expected error message appears on the page.
8. **Error Handling**: A try-except block captures any exceptions and ensures the browser closes after the test.

Note: Replace the locators (such as `By.NAME`, `By.CLASS_NAME`, etc.) with actual identifiers used in your webpage's HTML.