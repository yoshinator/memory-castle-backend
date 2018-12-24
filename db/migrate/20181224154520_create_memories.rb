class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.string :text
      t.string :x
      t.string :y
      t.integer :castle_id

      t.timestamps
    end
  end
end
