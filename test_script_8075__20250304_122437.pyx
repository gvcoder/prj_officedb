```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

# Test Data
username = "your_valid_username@yahoo.com"  # Replace with a valid Yahoo username
password = "your_valid_password"  # Replace with a valid Yahoo password

# Initialize WebDriver
driver = webdriver.Chrome()  # Ensure that the appropriate WebDriver is installed and configured

try:
    # Step 1: Given the user navigates to the login page
    driver.get("http://mail.yahoo.com")
    print("Navigated to Yahoo Mail login page.")
    time.sleep(2)  # Delay to make sure the page loads

    # Step 2: When the user enters valid username
    username_field = driver.find_element(By.ID, "login-username")  # Finding the username input field using ID
    username_field.send_keys(username)
    print("Entered username: ", username)
    time.sleep(1)  # Delay to observe the action

    # Click on 'Next' button
    next_button = driver.find_element(By.XPATH, "//input[@type='submit']")  # Finding 'Next' button using XPATH
    next_button.click()
    print("Clicked on the 'Next' button.")
    time.sleep(2)  # Wait for the next page to load

    # Step 3: When the user enters valid password
    password_field = driver.find_element(By.NAME, "password")  # Finding the password input field using NAME
    password_field.send_keys(password)
    print("Entered password.")
    time.sleep(1)  # Delay to observe the action

    # Click on 'Sign in' button
    sign_in_button = driver.find_element(By.XPATH, "//button[@type='submit']")  # Finding 'Sign in' button using XPATH
    sign_in_button.click()
    print("Clicked on the 'Sign in' button.")
    time.sleep(5)  # Wait for the email page to load

    # Step 4: Then the user should be redirected to the email page
    expected_url = "https://mail.yahoo.com/"
    actual_url = driver.current_url

    if actual_url == expected_url:
        print("Test Passed: User is redirected to the email page.")
    else:
        print("Test Failed: User is NOT redirected to the email page. Current URL: ", actual_url)

except Exception as e:
    print("An error occurred: ", str(e))

finally:
    driver.quit()  # Close the browser window
    print("Browser closed.")
```

### Explanation of the Script:
1. **Imports**: The required modules from Selenium and time are imported.
2. **Test Data**: Valid credentials for Yahoo are defined in variables.
3. **WebDriver Initialization**: Chrome WebDriver is initialized to interact with the browser.
4. **Navigations and Actions**:
   - The script opens the Yahoo login page.
   - It finds the username and password fields by their respective locators (ID, NAME).
   - It simulates user actions of entering credentials and clicking buttons.
5. **Assertions**: After logging in, it checks the URL to ensure the user was redirected to the email page.
6. **Error Handling**: Catches any exceptions and prints out an error message.
7. **Browser Cleanup**: Finally, the browser is closed regardless of test success or failure.

### Notes:
- Replace `your_valid_username@yahoo.com` and `your_valid_password` with actual valid Yahoo credentials for testing.
- Ensure that the Chrome WebDriver executable is correctly set up in your environment.
- Adjust the URL checks or element locators if there are changes in Yahoo's login page structure in the future.