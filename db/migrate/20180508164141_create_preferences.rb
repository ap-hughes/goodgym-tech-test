class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.boolean :grouprun, :default => false
      t.boolean :mission, :default => false
      t.boolean :coachrun, :default => false
      t.references :runner, foreign_key: true

      t.timestamps
    end
  end
end
