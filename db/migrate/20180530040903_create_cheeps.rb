class CreateCheeps < ActiveRecord::Migration[5.1]
  def change
    create_table :cheeps do |t|
      t.text :content

      t.timestamps
    end
  end
end
