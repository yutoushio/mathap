class CreateScataNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :scata_numbers do |t|
      t.float :number
      t.references :scatter, foreign_key: true

      t.timestamps
    end
  end
end
