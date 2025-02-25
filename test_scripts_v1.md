```python
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
import unittest

class SeleniumAutomationPracticeForm(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()
        self.driver.get("https://www.tutorialspoint.com/selenium/practice/selenium_automation_practice.php")
        self.driver.implicitly_wait(10)

    def test_valid_input(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("John Doe")
        driver.find_element(By.NAME, "email_id").send_keys("johndoe@example.com")
        driver.find_element(By.XPATH, "//input[@value='Male']").click()
        driver.find_element(By.NAME, "mobile").send_keys("1234567890")
        driver.find_element(By.NAME, "dob").send_keys("01/01/1990")
        driver.find_element(By.NAME, "subjects").send_keys("Maths, Chemistry")
        driver.find_element(By.XPATH, "//input[@value='Reading']").click()
        driver.find_element(By.XPATH, "//input[@value='Music']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("123 Main St, Cityville")
        driver.find_element(By.NAME, "state").send_keys("California")
        driver.find_element(By.NAME, "city").send_keys("Los Angeles")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        success_message = driver.find_element(By.CLASS_NAME, "success").text
        self.assertIn("Success", success_message)

    def test_empty_name(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("")
        driver.find_element(By.NAME, "email_id").send_keys("johndoe@example.com")
        driver.find_element(By.XPATH, "//input[@value='Male']").click()
        driver.find_element(By.NAME, "mobile").send_keys("1234567890")
        driver.find_element(By.NAME, "dob").send_keys("01/01/1990")
        driver.find_element(By.NAME, "subjects").send_keys("Maths, Chemistry")
        driver.find_element(By.XPATH, "//input[@value='Reading']").click()
        driver.find_element(By.XPATH, "//input[@value='Music']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("123 Main St, Cityville")
        driver.find_element(By.NAME, "state").send_keys("California")
        driver.find_element(By.NAME, "city").send_keys("Los Angeles")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        error_message = driver.find_element(By.CLASS_NAME, "error").text
        self.assertEqual(error_message, "Name cannot be empty")

    def test_invalid_email(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("John Doe")
        driver.find_element(By.NAME, "email_id").send_keys("invalid-email")
        driver.find_element(By.XPATH, "//input[@value='Male']").click()
        driver.find_element(By.NAME, "mobile").send_keys("1234567890")
        driver.find_element(By.NAME, "dob").send_keys("01/01/1990")
        driver.find_element(By.NAME, "subjects").send_keys("Maths, Chemistry")
        driver.find_element(By.XPATH, "//input[@value='Reading']").click()
        driver.find_element(By.XPATH, "//input[@value='Music']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("123 Main St, Cityville")
        driver.find_element(By.NAME, "state").send_keys("California")
        driver.find_element(By.NAME, "city").send_keys("Los Angeles")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        error_message = driver.find_element(By.CLASS_NAME, "error").text
        self.assertEqual(error_message, "Please enter a valid email ID")

    def test_max_length_name(self):
        driver = self.driver
        long_name = "A very long name that exceeds the character limit of the input field"
        driver.find_element(By.NAME, "name").send_keys(long_name)
        driver.find_element(By.NAME, "email_id").send_keys("johndoe@example.com")
        driver.find_element(By.XPATH, "//input[@value='Male']").click()
        driver.find_element(By.NAME, "mobile").send_keys("1234567890")
        driver.find_element(By.NAME, "dob").send_keys("01/01/1990")
        driver.find_element(By.NAME, "subjects").send_keys("Maths, Chemistry")
        driver.find_element(By.XPATH, "//input[@value='Reading']").click()
        driver.find_element(By.XPATH, "//input[@value='Music']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("123 Main St, Cityville")
        driver.find_element(By.NAME, "state").send_keys("California")
        driver.find_element(By.NAME, "city").send_keys("Los Angeles")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        error_message = driver.find_element(By.CLASS_NAME, "error").text
        self.assertEqual(error_message, "Name exceeds maximum length")

    def test_all_optional_fields(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("Jane Smith")
        driver.find_element(By.NAME, "email_id").send_keys("janesmith@example.com")
        driver.find_element(By.XPATH, "//input[@value='Female']").click()
        driver.find_element(By.NAME, "mobile").send_keys("0987654321")
        driver.find_element(By.NAME, "dob").send_keys("12/12/1995")
        driver.find_element(By.NAME, "subjects").send_keys("Physics, Biology")
        driver.find_element(By.XPATH, "//input[@value='Sports']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("456 Side St, Townsville")
        driver.find_element(By.NAME, "state").send_keys("Texas")
        driver.find_element(By.NAME, "city").send_keys("Houston")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        success_message = driver.find_element(By.CLASS_NAME, "success").text
        self.assertIn("Success", success_message)

    def test_invalid_mobile_number(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("Alice Doe")
        driver.find_element(By.NAME, "email_id").send_keys("alicedoe@example.com")
        driver.find_element(By.XPATH, "//input[@value='Female']").click()
        driver.find_element(By.NAME, "mobile").send_keys("1234")
        driver.find_element(By.NAME, "dob").send_keys("02/02/1988")
        driver.find_element(By.NAME, "subjects").send_keys("English, Literature")
        driver.find_element(By.XPATH, "//input[@value='Traveling']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("789 High St, Village")
        driver.find_element(By.NAME, "state").send_keys("Florida")
        driver.find_element(By.NAME, "city").send_keys("Miami")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        error_message = driver.find_element(By.CLASS_NAME, "error").text
        self.assertEqual(error_message, "Mobile number is invalid")

    def test_future_date_of_birth(self):
        driver = self.driver
        driver.find_element(By.NAME, "name").send_keys("Future Person")
        driver.find_element(By.NAME, "email_id").send_keys("futureperson@example.com")
        driver.find_element(By.XPATH, "//input[@value='Other']").click()
        driver.find_element(By.NAME, "mobile").send_keys("5555555555")
        driver.find_element(By.NAME, "dob").send_keys("01/01/2030")
        driver.find_element(By.NAME, "subjects").send_keys("Future Studies")
        driver.find_element(By.XPATH, "//input[@value='Gaming']").click()
        driver.find_element(By.NAME, "picture").send_keys("/path/to/profile.jpg")
        driver.find_element(By.NAME, "current_address").send_keys("999 Cloud St, Dreamland")
        driver.find_element(By.NAME, "state").send_keys("New York")
        driver.find_element(By.NAME, "city").send_keys("New York")
        driver.find_element(By.XPATH, "//button[text()='Submit']").click()
        time.sleep(2)
        error_message = driver.find_element(By.CLASS_NAME, "error").text
        self.assertEqual(error_message, "Date of birth cannot be in the future")

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    unittest.main()
``` 

This set of test scripts includes positive and negative test cases that thoroughly exercise the form functionality on the Selenium Automation Practice page. Each method corresponds to a scenario derived from the Gherkin format provided and validates the expected outcomes, ensuring coverage and adherence to automation testing best practices.