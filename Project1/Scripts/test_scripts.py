from selenium.webdriver import Chrome
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver import ActionChains
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
from dotenv import load_dotenv
import os

 # Set the timezone
load_dotenv()
#driver = Chrome(os.environ.get("CHROMEDRIVER_PATH")) Not required, webdriver_manager installs it automatically

s=Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=s)
wait = WebDriverWait(driver, 15)
driver.implicitly_wait(5)


# Valid/Invalid Password
def case1():
    return

# Empty password/username
def case2():
    bilkent_id.send_keys(os.environ.get("INCORRECT_BILKENT_ID")) # Enter correct Bilkent ID
    # Continue

# Reset Password
def case3():
    return

# Change the language and login
def case4():  
    driver.get(os.environ.get("WEBSITE"))

    # Input fields on the webpage
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    change_language_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[1]/button[1]') # Find the change language button
    ActionChains(driver).click(change_language_button).perform() # Click it 

    bilkent_id.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button

    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))

    expected_message = os.environ.get("VALID_BILKENT_ID")
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/h1').text 
    # Check if the message is as expected
    assert expected_message in actual_messsage, f'Error. Expected text to contain {expected_message}, but actual text {actual_messsage}'

    print("Test case 4 successful")

# Login from different timezone
def case5():
    # Must initialize new chromedriver with new timezone
    os.environ['TZ'] = 'Europe/London'
    driver2 = webdriver.Chrome(service=s)
    wait2 = WebDriverWait(driver2, 15) 
    ########################################################

    driver2.get(os.environ.get("WEBSITE"))
    driver2.execute_script("console.log(new Date().getTimezoneOffset());")
    
    # Input fields on the webpage
    bilkent_id = driver2.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver2.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver2.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    bilkent_id.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver2).click(submit_button).perform() # Click the submit button

    wait2.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="invalid_timezone"]')))
    expected_message = 'Wrong Timezone'
    actual_message = driver2.find_element(By.XPATH, '//*[@id="invalid_timezone"]').text
    # If the message appears on the screen, logging in from different timezone has been prevented
    assert expected_message == actual_message, f'Error. Expected text {expected_message}, but actual text {actual_message}'
    print("Test case 5 Succesful")
    driver2.quit()

case4()
driver.quit()
case5()