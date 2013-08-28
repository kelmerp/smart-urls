class Url < ActiveRecord::Base
  
  belongs_to :user

  validates :long_url, format: { with: /(http:\/\/|https:\/\/)/,
    message: "Hey Bro thats not valid! fix that shit!" }
  validates :long_url, length: { minimum: 15,
    message: "Hey bro, Man the fuck up and type it out!!" }

  before_save :increment_counter, :generate_short_url

  def increment_counter
    if self.click_count == nil
      self.click_count = 0 
    else
      self.click_count += 1 
    end
  end

  def generate_short_url
    self.short_url = "#{rand(100..100000000)}" + ".com" 
  end
end
