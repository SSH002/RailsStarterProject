class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.integer :account_id
      t.string :name
      t.integer :mana
      t.integer :happiens
      t.integer :fatigue
      t.integer :money

      t.timestamps
    end
  end
end
