require 'rspec-expectations'
require 'page-object'
require 'watir-webdriver'

#$browser = Watir::Browser.new :firefox
#at_exit{ $browser.quit}



World(PageObject::PageFactory)
