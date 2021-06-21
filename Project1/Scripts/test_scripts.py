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
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    bilkent_id.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button

    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = "Homepage"
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]').get_attribute("class") 
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 1.1 Successful')
def case1_2():
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    bilkent_id.send_keys("gibberish") # Enter incorrect Bilkent ID
    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'invalid_password'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]/div').get_attribute('id')
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 1.2 Successful')

def case1_3():
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    bilkent_id.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct Bilkent ID
    password.send_keys("gibberish") # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'invalid_password'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]/div').get_attribute('id')
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 1.3 Successful')


# Misisng/Empty Inputs
def case2_1():
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    password.send_keys(os.environ.get("VALID_PASSWORD")) # Enter correct password
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'no_blank_id'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]/div').get_attribute('id')
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 2.1 Successful')

def case2_2():
    bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
    password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
    submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')

    bilkent_id.send_keys(os.environ.get("VALID_BILKENT_ID")) # Enter correct id
    ActionChains(driver).click(submit_button).perform() # Click the submit button
    # Wait until the message div appears on DOM
    wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))
    expected_message = 'no_blank_password'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]/div').get_attribute('id')
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 2.2 Successful')


# Reset Password
def case3():
    change_language_button = driver.find_element(By.XPATH, '/html/body/div/div/div[1]/button[2]') # Find the reset password button
    ActionChains(driver).click(change_language_button).perform() # Click it
    driver.implicitly_wait(5)
    expected_message = 'Resetpage'
    # Retrieve the displayed message
    actual_messsage = driver.find_element(By.XPATH, '/html/body/div/div/div[2]').get_attribute('id')
    # Check if the message is as expected
    assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'
    print('Test case 3 Successful')

# Change the language and login
def case4():  
    change_language_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[1]/button[1]') # Find the change language button
    ActionChains(driver).click(change_language_button).perform() # Click it 
    case1_1() # Send Correct Credentials to login
    print("Test case 4 successful")

# Login from different timezone
def case5():
    return
case1_1()

driver.implicitly_wait(5)
driver.execute_script("window.history.go(-1)")
driver.implicitly_wait(5)
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))

case1_2()
driver.implicitly_wait(5)
driver.refresh()
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))

case1_3()
driver.implicitly_wait(5)
driver.refresh()
driver.implicitly_wait(5)
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))

case2_1()
driver.implicitly_wait(5)
driver.refresh()
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))

case2_2()
driver.implicitly_wait(5)
driver.refresh()
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))


bilkent_id = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[1]')
password = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[2]') 
submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/div[2]/form/input[3]')
case3()

driver.execute_script("window.history.go(-1)")
driver.implicitly_wait(5)
wait.until(EC.visibility_of_element_located((By.XPATH, '/html/body/div/div/div[2]/form')))

case4() # Run 4th script