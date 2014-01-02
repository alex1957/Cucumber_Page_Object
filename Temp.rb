class SlidersPage
  include PageObject
  page_url  'http://demos.kendoui.com/web/slider/index.html'
  link(:bal,:class => 'k-draghandle')

  # set balance slider to  data
  def balance(data)
    balance = data[0].to_i
    val = bal_element.element.attribute_value('aria-valuenow').to_i
    while val < balance
      bal_element.send_keys :arrow_right
      val = bal_element.element.attribute_value('aria-valuenow').to_i
    end
    while val > balance
      bal_element.send_keys :arrow_left
      val = bal_element.element.attribute_value('aria-valuenow').to_i
    end
  end
  # set sliders to  data
  def sliders(data)
    (1..5).each do |i|
      data[i] = data[i].to_i
      path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
      num_slider = @browser.link(:xpath => path)
      val = num_slider.attribute_value('aria-valuenow').to_i
      while val < data[i]
        num_slider.send_keys :arrow_up
        val =  num_slider.attribute_value('aria-valuenow').to_i
      end
      while val > data[i]
        num_slider.send_keys :arrow_down
        val = num_slider.attribute_value('aria-valuenow').to_i
      end
    end
  end
  # transfer data form step definition
  def set_sliders(data)
    balance(data)
    sliders(data)
  end
  # transfer data to step definition
  def get_sliders_data
    actual =[]
    actual <<  bal_element.element.attribute_value('aria-valuenow')
    (1..5).each do |i|
      path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
      actual << @browser.link(:xpath => path).attribute_value('aria-valuenow')
    end
    return actual
  end
end

#div class="k-slider-track"