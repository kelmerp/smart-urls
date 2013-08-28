class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :code_name, uniqueness: true


  def self.authenticate(code_name,password)
    User.find_by_code_name_and_password(code_name, password)
  end
end
