class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :password
      t.integer :mana
      t.integer :happiens
      t.integer :fatigue
      t.integer :money
      t.integer :wins
      t.integer :defeates

      t.timestamps
    end
  end
end
