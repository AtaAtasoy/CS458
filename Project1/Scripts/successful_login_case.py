from selenium.webdriver import Chrome
from selenium.webdriver.chrome.webdriver import WebDriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver import ActionChains
from dotenv import load_dotenv
import os

# This example opens the stars login page and inputs a BilkentID and password
# The test case is checking if the login was successful 
# Lines commented out are working examples

load_dotenv()

driver = Chrome(os.environ.get("CHROMEDRIVER_PATH"))
wait = WebDriverWait(driver, 15)

driver.get(os.environ.get("WEBSITE"))

username = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[1]')

username.send_keys(os.environ.get("BILKENT_ID"))
#username.send_keys(54414028)

password = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[2]')

password.send_keys(os.environ.get("PASSWORD"))
#password.send_keys("zAencs1t")

submit_button = driver.find_element(By.XPATH, '//*[@id="root"]/div/form/input[3]')

ActionChains(driver).click(submit_button).perform()

men_menu = wait.until(EC.visibility_of_element_located((By.XPATH, '//*[@id="root"]/div/div')))

expected_message = 'Login Successful'
actual_messsage = driver.find_element(By.XPATH, '//*[@id="root"]/div/div').text

# If the page contains 'SMS Verification', Bilkent ID and Password was valid.
assert expected_message == actual_messsage, f'Error. Expected Text {expected_message}, but actual text {actual_messsage}'

