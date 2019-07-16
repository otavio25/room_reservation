class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.time :hour, null: false
      t.date :rental_date, null: false
      t.text :description
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
