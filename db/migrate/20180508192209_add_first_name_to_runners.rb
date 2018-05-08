class AddFirstNameToRunners < ActiveRecord::Migration[5.1]
  def change
    add_column :runners, :first_name, :string
  end
end
