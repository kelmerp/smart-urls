class Users < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :first_name
      user.string :last_name
      user.string :code_name
      user.string :email
      user.string :password
    end
  end
end
