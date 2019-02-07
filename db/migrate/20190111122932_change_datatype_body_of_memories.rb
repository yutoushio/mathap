class ChangeDatatypeBodyOfMemories < ActiveRecord::Migration[5.2]
  def change
    change_column :memories, :body, :string
  end
end
