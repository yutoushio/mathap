class CreateScaNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :sca_numbers do |t|
      t.float :number
      t.references :Scatter, foreign_key: true

      t.timestamps
    end
  end
end
