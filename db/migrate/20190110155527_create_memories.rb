class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.float :body
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
