class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :city
      t.string :state
      t.text :bio
      t.integer :zip

      t.timestamps
    end
  end
end
