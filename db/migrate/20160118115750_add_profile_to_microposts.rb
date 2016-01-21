class AddProfileToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :profile, :string
  end
end
