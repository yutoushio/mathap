class CreateLineNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :line_numbers do |t|
      t.float :number
      t.references :line, foreign_key: true

      t.timestamps
    end
  end
end
