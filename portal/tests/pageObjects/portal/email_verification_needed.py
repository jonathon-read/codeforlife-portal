from django.conf import settings
from selenium import webdriver

from base import BasePage

class EmailVerificationNeededPage(BasePage):
    def __init__(self, browser):
        super(EmailVerificationNeededPage, self).__init__(browser)

        self.browser.find_element_by_id('emailVerificationNeeded_page')

    def returnToHomePage(self):
        self.browser.find_element_by_id('homepage_button').click()
        return home.HomePage(self.browser)

import home