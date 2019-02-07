class CreateScatNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :scat_numbers do |t|
      t.float :number
      t.references :scatter, foreign_key: true

      t.timestamps
    end
  end
end
