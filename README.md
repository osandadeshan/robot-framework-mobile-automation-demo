# Robot Framework Mobile Automation Demo

This project serves as a boilerplate for automating both Android and iOS mobile applications using a single codebase with Robot Framework and the Appium library.

## Robot Framework Introduction
[Robot Framework](http://robotframework.org) is a generic open source
automation framework for acceptance testing, acceptance test driven
development (ATDD), and robotic process automation (RPA). It has simple plain
text syntax and it can be extended easily with libraries implemented using
Python or Java.

Robot Framework is operating system and application independent. The core
framework is implemented using [Python](http://python.org), supports both
Python 2 and Python 3, and runs also on [Jython](http://jython.org) (JVM),
[IronPython](http://ironpython.net) (.NET) and [PyPy](http://pypy.org).
The framework has a rich ecosystem around it consisting of various generic
libraries and tools that are developed as separate projects. For more
information about Robot Framework and the ecosystem, see
http://robotframework.org.

Robot Framework project is hosted on GitHub where you can find source code,
an issue tracker, and some further documentation. Downloads are hosted on PyPI, except
for the standalone JAR distribution that is on Maven central.

Robot Framework development is sponsored by [Robot Framework Foundation](http://robotframework.org/foundation).

[GitHub](https://github.com/robotframework/robotframework)

[PyPI](https://pypi.python.org/pypi/robotframework)

[Maven central](http://search.maven.org/#search%7Cga%7C1%7Ca%3Arobotframework)

## Installation
1. Install [XCode](https://apps.apple.com/us/app/xcode/id497799835?mt=12 "XCode")

2. Download and Install [Android Studio](https://developer.android.com/codelabs/basic-android-kotlin-compose-install-android-studio "Android Studio")

3. Download and Install [Python](https://www.python.org/downloads/ "Python")

4. Check Python installation

    `python3 -V`

5. Install [pip](https://pip.pypa.io/ "pip")

    `pip3 -V`

6. Install Appium 2.0
    `npm i -g appium@next`

7. Install Robot Framework

    `pip3 install robotframework`
    
8. Install Appium Library

    `pip3 install robotframework-appiumlibrary`
    
9. Download and install VSCode [VSCode](https://code.visualstudio.com/docs/?dv=osx "VSCode")

10. Install [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode "Robot Code") extension from VSCode's Marketplace

11. Install Appium Drivers 

    `appium driver install uiautomator2`
    
    `appium driver install xcuitest`

## Example
Here, I have developed sample test cases for a sample mobile application [Guinea Pig](https://github.com/webdriverio/native-demo-app/).

This project is developed to demontrate robot framework with appium and page object model.

Here, there are 3 variables `${SMALL_RETRY_SCALE}`, `${MEDIUM_RETRY_SCALE}` and `${LARGE_RETRY_SCALE}` for retrying the keywords when they are failing. Each variable has assigned with the number of retries. Automation engineers are advised to use `${SMALL_RETRY_SCALE}` as the default number of retries for the keywords. If there are big delays in some scenarios, you can use other variables `${MEDIUM_RETRY_SCALE}` and `${LARGE_RETRY_SCALE}`. You can find the examples for this in `object-repository/page-objects` directory.

Test cases are in `test-cases` directory and covers login and signup functionalities.

## File organization
```
|- robot-framework-mobile-automation-demo/                        // Home folder for robot appium mobile automation project
  |- configs/AppiumConfigs.robot                                  // Appium configurations file
  |- configs/ApplicationConfigs.robot                             // Application configurations file
  |- constants/*.robot                                            // Robot files for the constants
  |- object-repository/locators/*.robot                           // UI locators of the application
  |- object-repository/page-objects/CommonPo.robot                // Common keywords for the application
  |- object-repository/page-objects/*.robot                       // Page object keywords of the application
  |- test-cases/*.robot                                           // Test cases of the application
|- results                                                        // Test results will be saving here
|- .gitignore                                                     // Excluded the unnecessary files in the repo
|- README.md                                                      // This file
```

## Usage
Starting from Robot Framework 3.0, tests are executed from the command line
using the ``robot`` script or by executing the ``robot`` module directly
as ``python -m robot``.

The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path

    python3 -m robot -v PLATFORM_NAME:ios -i Smoke -d results test-cases

"***-v***" refers to the variables. To replace a declared value within the code, you can specify a variable name and value.

"***-i***" refers to the tags. To run only a selected group of tests, you may specify a tag name.

"***-d***" refers to the test results. The location to save the test results can be specified here.

Run ``robot --help`` and ``rebot --help`` for more information about the command
line usage. For a complete reference manual see [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html "Robot Framework User Guide").

**Note**: We have encountered an issue with the demo mobile application developed using an older version of React Native (0.64.1). The problem arises when password text inputs are highlighted in yellow with the text "Strong Password," rendering them unusable. As a workaround, please follow the instructions below to update your iPhone simulator.

1. Go to "Settings"
2. Select "Passwords"
3. Input your PIN
4. Select "Password Options"
5. Turn off the "AutoFill Passwords"

## License
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/License_icon-mit-2.svg/2000px-License_icon-mit-2.svg.png" alt="MIT License" width="100" height="100"/> [MIT License](https://opensource.org/licenses/MIT)

## Copyright
Copyright 2023 [MaxSoft](https://maxsoftlk.github.io/ "MaxSoft")
