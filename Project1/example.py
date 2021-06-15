from selenium.webdriver import Chrome
from selenium.webdriver.chrome.webdriver import WebDriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from dotenv import load_dotenv
import os

# This example opens the stars login page and inputs a BilkentID and password
# The test case is checking if the login was successful 

load_dotenv()

driver = Chrome(os.environ.get("CHROMEDRIVER_PATH"))
wait = WebDriverWait(driver, 15)

driver.get("https://stars.bilkent.edu.tr/accounts/login/")

username = driver.find_element(By.XPATH, "/html/body/div/div[1]/div[2]/div[1]/div/section/form/fieldset/div/div[1]/div[1]/div/div/input")

username.send_keys(os.environ.get("BILKENT_ID"))

password = driver.find_element(By.XPATH, "/html/body/div/div[1]/div[2]/div[1]/div/section/form/fieldset/div/div[1]/div[2]/div/div/input")

password.send_keys(os.environ.get("PASSWORD"), Keys.ENTER)

wait.until(EC.url_changes(driver.current_url))

expected_legend = 'SMS Verification'
actual_legend = driver.find_element(By.XPATH, "/html/body/div/div[1]/div[2]/div[1]/div/section/form/fieldset/legend").text

# If the page contains 'SMS Verification', Bilkent ID and Password was valid.
assert expected_legend == actual_legend, f'Error. Expected Text {expected_legend}, but actual text {actual_legend}'

