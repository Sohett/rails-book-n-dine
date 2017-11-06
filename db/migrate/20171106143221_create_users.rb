class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.boolean :owner
      t.string :last_name
      t.string :first_name
      t.float :phone_number
      t.references :registration, foreign_key: true

      t.timestamps
    end
  end
end
