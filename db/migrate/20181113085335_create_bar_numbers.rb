class CreateBarNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_numbers do |t|
      t.float :number
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
