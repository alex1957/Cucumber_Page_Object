class SlidersPage
  include PageObject
  page_url  'http://demos.kendoui.com/web/slider/index.html'

  link(:balance,:xpath => "//*[@id='wrapper']/div[1]/div/div/a")
  link(:slider1,:xpath => "//*[@id='equalizer']/div[1]/div/div/a")
  link(:slider2,:xpath => "//*[@id='equalizer']/div[2]/div/div/a")
  link(:slider3,:xpath => "//*[@id='equalizer']/div[3]/div/div/a")
  link(:slider4,:xpath => "//*[@id='equalizer']/div[4]/div/div/a")
  link(:slider5,:xpath => "//*[@id='equalizer']/div[5]/div/div/a")

   # set sliders to  data
   def sliders(data)
     i=0
     names = [balance_element, slider1_element, slider2_element, slider3_element, slider4_element, slider5_element]
     names.each do |name|
     val = name.attribute('aria-valuenow').to_i
     while val < data[i].to_i
       name.send_keys :arrow_right
       val = name.attribute('aria-valuenow').to_i
     end
     while val > data[i].to_i
       name.send_keys :arrow_left
       val = name.attribute('aria-valuenow').to_i
     end
       i += 1
     end
   end

  # transfer data form step definition
  def set_sliders(data)
   sliders(data)
  end

  # transfer data to step definition
  def get_sliders_data
      actual =[]
      names = [balance_element, slider1_element, slider2_element, slider3_element, slider4_element, slider5_element]
      names.each do |name|
        actual  << name.attribute('aria-valuenow')
      end
      return actual
   end

  end


