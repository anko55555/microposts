class AddAreaToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :area, :string
  end
end
