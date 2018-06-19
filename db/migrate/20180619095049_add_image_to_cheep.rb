class AddImageToCheep < ActiveRecord::Migration[5.1]
  def change
    add_column :cheeps, :image, :text
  end
end
