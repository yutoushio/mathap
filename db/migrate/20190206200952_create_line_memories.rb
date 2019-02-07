class CreateLineMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :line_memories do |t|
      t.string :body
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
