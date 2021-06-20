from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver import ActionChains
from dotenv import load_dotenv
import os


load_dotenv()
driver = Chrome(os.environ.get("CHROMEDRIVER_PATH"))
wait = WebDriverWait(driver, 15)
driver.get(os.environ.get("WEBSITE"))
# Input fields on the webpage
username = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[1]')
password = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[2]') 
submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[3]')


# Valid credentials
def case1():
    username.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'Login Successful'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'

# Invalid Bilkent ID
def case2():
    username.send_keys(os.environ.get("INCORRECT_BILKENT_ID")) # Enter correct Bilkent ID
    # Continue

# Invalid Password
def case3():
    return

# Change the language and login
def case4():  
     
    return

# Empty Password ? 
def case5():
    return

case1() # Run first script