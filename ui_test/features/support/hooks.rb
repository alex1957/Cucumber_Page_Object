require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
  #@browser.window.maximize
end

After do |scenario|
  if scenario.failed?
    fname = "#{Time.now}.png "
    @browser.screenshot.save fname
    embed fname, 'image/png', 'SCREENSHOT'
  end
  @browser.quit
end

