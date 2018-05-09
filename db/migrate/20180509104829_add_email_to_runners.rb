class AddEmailToRunners < ActiveRecord::Migration[5.1]
  def change
    add_column :runners, :email, :string
  end
end
