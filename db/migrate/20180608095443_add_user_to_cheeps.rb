class AddUserToCheeps < ActiveRecord::Migration[5.1]
  def change
    add_reference :cheeps, :user
  end
end
