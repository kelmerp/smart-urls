class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :code_name, uniqueness: true


  def self.authenticate(args)
    User.find_by_code_name_and_password(args[:code_name], args[:password])
  end
end
