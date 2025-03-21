```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

# Define constants for credentials and item details
USERNAME = "standard_user"
PASSWORD = "secret_sauce"
ITEM_NAME = "Sauce Labs Bike Light"
FIRST_NAME = "John"
LAST_NAME = "Doe"
ZIP_CODE = "12345"

# Create a Selenium WebDriver instance
driver = webdriver.Chrome()  # Make sure you've set up your WebDriver correctly

try:
    # Step 1: User is on the login page
    driver.get("https://www.saucedemo.com/")
    print("Opened the login page.")
    time.sleep(2) # Wait for the page to load

    # Step 2: User logs in with valid credentials
    driver.find_element(By.ID, "user-name").send_keys(USERNAME)
    driver.find_element(By.ID, "password").send_keys(PASSWORD)
    driver.find_element(By.ID, "login-button").click()
    print("Logged in with valid credentials.")
    time.sleep(2)

    # Step 3: User is on the inventory page
    print("Current URL:", driver.current_url)
    assert "inventory.html" in driver.current_url # Validate user is on inventory page
    time.sleep(2)

    # Step 4: User selects "Sauce Labs Bike Light"
    item = driver.find_element(By.XPATH, f"//div[text()='{ITEM_NAME}']")
    item.click()
    print(f"Selected item: {ITEM_NAME}")
    time.sleep(2)

    # Step 5: User clicks "Add to Cart"
    driver.find_element(By.XPATH, "//button[text()='Add to cart']").click()
    print(f"Added {ITEM_NAME} to cart.")
    time.sleep(2)

    # Step 6: User clicks the shopping cart icon
    driver.find_element(By.CLASS_NAME, "shopping_cart_link").click()
    print("Clicked on Shopping Cart icon.")
    time.sleep(2)

    # Step 7: User clicks the "Checkout" button
    driver.find_element(By.XPATH, "//button[text()='Checkout']").click()
    print("Clicked on Checkout button.")
    time.sleep(2)

    # Step 8: User fills in the checkout form
    driver.find_element(By.ID, "first-name").send_keys(FIRST_NAME)
    driver.find_element(By.ID, "last-name").send_keys(LAST_NAME)
    driver.find_element(By.ID, "postal-code").send_keys(ZIP_CODE)
    print("Filled checkout form with provided details.")
    time.sleep(2)

    # Step 9: User clicks "Finish"
    driver.find_element(By.XPATH, "//input[@value='Continue"]').click()
    driver.find_element(By.XPATH, "//button[text()='Finish']").click()
    print("Clicked Finish.")
    time.sleep(2)

    # Step 10: User should see the checkout complete page
    assert "checkout-complete.html" in driver.current_url
    print("Checkout completed successfully - Checkout Complete Page displayed.")
    time.sleep(2)

    # Step 11: User clicks "Back Home"
    driver.find_element(By.XPATH, "//button[text()='Back Home']").click()
    print("Clicked Back Home.")
    time.sleep(2)

    # Step 12: User should be redirected back to the inventory page
    assert "inventory.html" in driver.current_url
    print("Successfully redirected back to the inventory page.")

finally:
    time.sleep(5)  # Wait for 5 seconds to observe the final state
    driver.quit()  # Close the browser
```

This script follows the outlined steps in the specified scenario, includes appropriate print statements for status updates, introduces delays for visibility of actions, asserts to validate conditions, and uses multiple Selenium find methods for different actions. Adjust the WebDriver path and ensure your browser is compatible with the respective WebDriver used.