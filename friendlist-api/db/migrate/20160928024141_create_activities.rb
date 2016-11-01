class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :message
      t.string :city
      t.string :state
      t.integer :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
