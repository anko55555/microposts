class AddEmailToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :email, :varchar
  end
end
