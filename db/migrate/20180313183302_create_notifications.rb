class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :description
      t.string :category
      t.string :email
      t.decimal :cost, precision: 8, scale: 2
      t.datetime :term

      t.timestamps
    end
  end
end
