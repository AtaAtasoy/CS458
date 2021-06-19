# Project 1 - Automated Web Testing with Selenium

## Report

[Click here to edit the report](https://docs.google.com/document/d/1uFZeMju9XPoe6h4nMf7HrCA_6m5oa4refd7nQ7KwR-8/edit?usp=sharing)

## Project Structure

- `Scripts/` for the Selenium scripts.
- `Views/` for the login page.

## Requirements

### Chromedriver

The project uses Google Chrome as the browser, therefore ChromeDriver is required. [Download](https://chromedriver.chromium.org/downloads) the corresponding ChromeDriver binary for your Chrome version.
You should specify the path to your ChromeDriver binary to use Selenium WebDriver.

### Python3 (3.8 prefered)

Use Python3 (3.8 / 3.9 Pref.) Install virtualenv for Python, it will be useful to keep the dependencies consistent for each member of the group.

```bash
$sudo add-apt-repository ppa:deadsnakes/ppa
$sudo apt update
$sudo apt install python3.8
$pip install virtualenv # Required
```

Note that sometimes command `python/pip` might refer to python2.7 and `python3/pip3` might refer to python3.\*. Use python3 and pip3 instead of python/pip if you are facing this problem.

### Node (14.4) and NPM

The webpage is implemented with React, hence Node is required.

[More info](https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/#installing-nodejs-and-npm-using-nvm)

```bash
$curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash # Install node version manager (nvm)
$nvm install 14.4 # Install the required npm version
```

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
$python `test_scripts.py` # Launch the test script
```

If you install any other dependency, update `requirements.txt` with ```pip freeze > requirements.txt```
Do not forget to activate/deactivate virtualenv before/after working.

## Setup for Frontend

```bash
$cd Views/login
$npm install
$npm start
```

The React App will launch.

### Environment Variables

An environment variable to store the path to the ChromeDriver, valid Bilkent ID, valid password, invalid Bilkent ID, invalid password and the website containing the IP of the local computer. Create the `.env` file under `Scripts/`.

```bash
$touch .env #Creates the environment variable
```

List of environment variables:

```bash
INVALID_BILKENT_ID
INVALID_PASSWORD
VALID_BILKENT_ID
VALID_PASSWORD
CHROMEDRIVER_PATH
WEBSITE
```

The environment variables work as a Key-Value pair. Your .env file should look like this.
![.env structure](https://i.hizliresim.com/f5zavtr.png)