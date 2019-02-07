class CreateScatterNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :scatter_numbers do |t|
      t.float :number
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
