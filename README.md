

 Robot Framework Automation

This repository contains an automation script for an assessment task using Robot Framework and Selenium.

Setup

Prerequisites
- Python 3
-RobotFramework
- Virtual Environment
- ChromeDriver
-IDE

Installation

1. Create a virtual environment:
  
   python3 -m venv venv
   source venv/bin/activate
   

2. Install the necessary libraries:
   
   pip3 install robotframework
   pip3 install robotframework-seleniumlibrary
   

3. Install ChromeDriver:
   - Download the ChromeDriver from [here](https://sites.google.com/a/chromium.org/chromedriver/downloads) matching your Chrome version.
   - Unzip the downloaded file.
   - Move it to a directory included in your system’s `PATH`, for example:
     bash
     sudo mv chromedriver /usr/local/bin/
     ```

Project Structure

- path.py: Stores all the XPaths and URLs.
- keywords.robot: Contains keywords (similar to functions in PyTest) used for automation.
- testcases.robot: Contains test cases and imports the keyword file.


Usage

Running the Tests

1. Activate the virtual environment if not already activated:
   bash
   source venv/bin/activate


2. Run the test cases:
   bash
   robot testcases.robot
   

Explanation

- path.py: This file includes all the necessary paths and URLs.
- keywords.robot: Defines reusable keywords. Keywords are analogous to functions or methods in other programming languages.
- testcases.robot: Contains the actual test cases. It imports the `keywords.robot` file using the `Resource` keyword in the settings. The test setup includes the launch setup keyword, which opens the browser with a null value for the URL.


# Robotframework-Python-
