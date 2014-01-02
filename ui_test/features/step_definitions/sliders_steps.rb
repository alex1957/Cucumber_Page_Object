
Given(/^I'm on a sliders page$/) do
  visit_page (SlidersPage)
end

When(/^I set slider Balance to  "(.*?)" and Equalizer to  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)" ,  "(.*?)"$/) do |balance, slider_1, slider_2, slider_3, slider_4, slider_5|
  data = [balance, slider_1, slider_2, slider_3, slider_4, slider_5]
  on(SlidersPage).set_sliders(data)
end

Then(/^I should read data from  Balance "(.*?)" and Equalizer  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)",  "(.*?)"$/) do |balance, slider_1, slider_2, slider_3, slider_4, slider_5|
  expected = [balance, slider_1, slider_2, slider_3, slider_4, slider_5]
  actual = on(SlidersPage).get_sliders_data
  actual.should == expected
end
