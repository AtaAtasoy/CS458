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
driver.implicitly_wait(5)
# Input fields on the webpage
bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')


# Valid credentials
def case1_1():
    username.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = os.environ.get("VALID_BILKENT_ID")
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/h1').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
def case1_2():
    username.send_keys("gibberish") # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'Invalid Id'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
def case1_3():
    username.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys("gibberish") # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'Invalid Password'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'



# Misisng/Empty Inputs
def case2_1():
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'Bilkent ID cannot be blank'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'

def case2_2():
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'Bilkent ID cannot be blank'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'


# Reset Password
def case3():
    return

# Change the language and login
def case4():  
    change_language_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[1]/button[1]') # Find the change language button
    ActionChains(driver).click(change_language_button).perform() # Click it 
    valid_credentials_login() # Send Correct Credentials to login
    print("Test case 4 successful")

# Login from different timezone
def case5():
    return

case4() # Run 4th script