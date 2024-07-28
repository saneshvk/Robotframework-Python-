
Robot Framework Automation

This repository contains an automation script for an assessment task using Robot Framework and Selenium.

 Setup:

 Prerequisites:

- Python 3
- Robot Framework
- Virtual Environment
- ChromeDriver
- IDE

Installation:

1. Create a virtual environment:

 
    python3 -m venv venv
    source venv/bin/activate
  

2. Install the necessary libraries:

 
    pip3 install robotframework
    pip3 install robotframework-seleniumlibrary
  

3. Install ChromeDriver:

    - Download the ChromeDriver from [here](https://sites.google.com/a/chromium.org/chromedriver/) matching your Chrome version.
    - Unzip the downloaded file.
    - Move it to a directory included in your system’s PATH, for example:

  
    sudo mv chromedriver /usr/local/bin/
   

Project Structure:


project_root/
│
├── automation/
│   ├── paths.py
│   ├── keywords.robot
│   └── testcases.robot


- `paths.py`: Stores all the XPaths and URLs.
- `keywords.robot`: Contains keywords (similar to functions in PyTest) used for automation. This file imports variables from `paths.py`.
- `testcases.robot`: Contains test cases and imports the `keywords.robot` file. The URL is set to null to handle multiple URLs during the automation process.

 Usage

 Running the Tests:

1. Activate the virtual environment if not already activated:

    
    source venv/bin/activate
  

2. Run the test cases:

    
    robot automation/testcases.robot
    

 Explanation

- `paths.py`: This file includes all the necessary paths and URLs. By importing this file in `keywords.robot`, variables such as XPaths and URLs can be used seamlessly in the keywords.
  
- `keywords.robot`: Defines reusable keywords. Keywords in Robot Framework are analogous to functions or methods in PyTest. They encapsulate the actions to be performed during the tests and can take arguments to make them more flexible. For example, if you have a keyword to open a URL, you can pass the specific URL as an argument to this keyword.
  
- `testcases.robot`: Contains the actual test cases. It imports the `keywords.robot` file using the `Resource` keyword in the settings. The test setup includes the launch setup keyword(custom), which opens the browser with a null value for the URL. This is done because the automation process involves several URLs, and setting a specific URL could cause it to be opened with every test case. By setting the URL as null and using a valid browser driver, the URL can be passed as an argument with each keyword.

 Keywords and Arguments in Robot Framework vs. PyTest:

- Robot Framework Keywords: In Robot Framework, keywords are akin to functions in PyTest. They define a series of actions to perform a specific task. Keywords can be created using the `*** Keywords ***` section and can accept arguments to make them reusable with different data.

   
    *** Keywords ***
    Open Browser With URL
        [Arguments]    ${url}
        Open Browser    ${url}    chrome
  

- PyTest Functions: In PyTest, functions serve a similar purpose. They define actions to perform during tests and can accept parameters to be used with different data.

    
    def test_open_browser_with_url(url):
        driver = webdriver.Chrome()
        driver.get(url)
  

Both keywords in Robot Framework and functions in PyTest help modularize and reuse test code, making it easier to manage and maintain. Keywords in Robot Framework are specifically designed to be readable and user-friendly, aligning with its goal of being a framework for acceptance testing and robotic process automation.

