class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :municipality
      t.integer :capacity
      t.string :category
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
