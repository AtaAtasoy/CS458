# Project 1 - Automated Web Testing with Selenium

## Project Structure

- `Scripts/` for the Selenium scripts.
- `Views/` for the login page.

## Requirements

The project uses Google Chrome as the browser, therefore ChromeDriver is required. [Download](https://chromedriver.chromium.org/downloads) the corresponding ChromeDriver binary for your Chrome version.
You should specify the path to your ChromeDriver binary to use Selenium WebDriver.

Use Python3 (3.8 / 3.9 Pref.) Install virtualenv for Python, it will be useful to keep the dependencies consistent for each member of the group.

You can install virtualenv with:

```bash
pip install virtualenv
```

Note that sometimes command `python/pip` might refer to python2.7 and `python3/pip3` might refer to python3.\*. Use python3 and pip3 instead of python/pip if you are facing this problem.

## Setup for Python Scripts

You only have to setup once unless there are new features added.
Clone the repo and do the following.

```bash
$cd Scripts # Locate to the api/ folder
$python -m virtualenv venv # Create a virtual env for python
$. venv/bin/activate # Activate the virtual env use don't forget to use 'deactivate' to exit venv
$source venv/bin/activate # Mac users should use this to activate the virtual env
$.\venv\Scripts\activate # On Windows (Might be wrong) 
$pip install -r requirements.txt # Install python dependencies
$python `filename.py` # Launch the test script
```

If you install any other dependency, update `requirements.txt` with ```pip freeze > requirements.txt```
Do not forget to activate/deactivate virtualenv before/after working.

### Notes for the successful_login_case.py

I used an environment variable to store the path to the ChromeDriver binary on my computer, my BilkentID and SRS Password, thus to run the script on your pc, you should create an environment variable file under `Scripts/`.

```bash
$touch .env #Creates the environment variable
```

The environment variables work as a Key-Value pair. Your .env file should look like this.

![.env structure](https://i.hizliresim.com/l92a5rp.png)