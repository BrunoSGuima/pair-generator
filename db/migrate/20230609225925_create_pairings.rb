class CreatePairings < ActiveRecord::Migration[7.0]
  def change
    create_table :pairings do |t|
      t.string :pair, null: false

      t.timestamps
    end

    add_index :pairings, :pair, unique: true
  end
end



