```python
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys

# Initialize the WebDriver
driver = webdriver.Chrome()  # Make sure the ChromeDriver is in your PATH

# Test Data
url = "http://example.com"
username = "test_user"
password = "password123"

def test_login():
    try:
        # Navigate to the URL
        driver.get(url)
        print(f"Navigated to {url}")
        time.sleep(2)

        # Find and fill the username field
        user_field = driver.find_element(By.NAME, "username")
        user_field.send_keys(username)
        print(f"Entered username: {username}")
        time.sleep(1)
        
        # Find and fill the password field
        pass_field = driver.find_element(By.NAME, "password")
        pass_field.send_keys(password)
        print("Entered password.")
        time.sleep(1)

        # Click the login button
        login_button = driver.find_element(By.ID, "loginBtn")
        login_button.click()
        print("Clicked on the login button.")
        time.sleep(3)

        # Validate login
        welcome_message = driver.find_element(By.XPATH, "//h1[contains(text(), 'Welcome')]")
        assert welcome_message.is_displayed(), "Login failed. Welcome message not displayed."
        print("Login successful, welcome message is displayed.")

    except Exception as e:
        print(f"An error occurred: {e}")

def test_search_functionality():
    try:
        # Perform search operation
        search_field = driver.find_element(By.CSS_SELECTOR, "input[name='search']")
        search_field.send_keys("Selenium" + Keys.RETURN)
        print("Searched for 'Selenium'.")
        time.sleep(2)

        # Validate search results
        search_results = driver.find_elements(By.CLASS_NAME, "search-result")
        assert len(search_results) > 0, "Search returned no results."
        print("Search results found.")

    except Exception as e:
        print(f"An error occurred: {e}")


def run_tests():
    test_login()
    test_search_functionality()

if __name__ == "__main__":
    run_tests()
    driver.quit()
```

### Explanation of the Script:
1. **Imports and Setup**: The script imports necessary modules from Selenium and configures the Chrome WebDriver.
2. **Test Data**: Define the URL and credentials to be used in the tests.
3. **Test Functions**:
   - `test_login()`: Tests the login functionality by locating elements through name and id attributes, filling in credentials, clicking the login button, and asserting that the welcome message is displayed.
   - `test_search_functionality()`: Tests the search by locating the search field, entering a search term, and checking that search results are displayed.
4. **Execution**: The main function runs both tests consecutively and ensures the browser closes at the end.

### Notes:
- An appropriate delay (`time.sleep()`) has been added after each action to ensure visibility of outputs.
- Print statements are used to provide clear feedback regarding the steps taken and outcomes. 
- The use of assertions helps validate that the test met expectations, making the script robust against failures. 
- Ensure correct WebDriver and browser versions are in use to accommodate Selenium interactions.